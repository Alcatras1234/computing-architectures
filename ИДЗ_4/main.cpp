#include <iostream>
#include <pthread.h>
#include <vector>
#include <random>
#include <fstream>
#include <unistd.h>

pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
int completed_crews = 0;
std::string filename; //имя файла

void* searchForTreasure(void* crew_id_ptr) {
    int crew_id = *((int*)crew_id_ptr);
    // Логика поиска клада
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> treasure(0, 1);

    int found = treasure(gen); // случайное нахождение клада (0 - не найдено, 1 - найдено)

    pthread_mutex_lock(&mtx); // блокировка мьютекса для вывода
    std::cout << "Group " << crew_id << " search treasure on own site: ";
    if (found)
        std::cout << "treasure found" << std::endl;
    else
        std::cout << "treasure not found" << std::endl;
    completed_crews++;
    std::ofstream outfile(filename, std::ios_base::app);
    outfile << "Group " << crew_id << " search treasure on own site: ";
    if (found)
        outfile << "treasure found" << std::endl;
    else
        outfile << "treasure not found" << std::endl;
    completed_crews++;
    outfile.flush();
    pthread_mutex_unlock(&mtx); // разблокировка мьютекса

    pthread_cond_signal(&cond); // уведомление управляющего потока о завершении поиска
    pthread_exit(NULL);
}

void* johnSilver(void*) {
    int num_of_crews;
    std::string aswer;
    std::cout<<"Do you want you file info for input[Y/N] ";
    std::cin>>aswer;
    if (aswer == "Y") { // читаем число пиратов из файла
        std::string filenam_inp;
        std::cout << "Enter input filename: ";
        std::cin >> filenam_inp;
        std::ifstream infile(filenam_inp);
        if (!infile.is_open()) {
            std::cerr << "Cant open a file";
            return NULL;
        }
        infile >> num_of_crews;
        infile.close();
    } else {
        std::cout << "Enter number of group: ";
        std::cin >> num_of_crews;

    }
    std::cout << "Enter output file name: ";
    std::cin >> filename;

    std::vector<pthread_t> crews;
    for (int i = 0; i < num_of_crews; ++i) { // заполнение вектора экипажем
        int* crew_id = new int(i);
        pthread_t crew;
        pthread_create(&crew, NULL, searchForTreasure, (void*)&i);
        crews.push_back(crew);
    }
    std::cout << "Jon Silver wait a result" << std::endl;
    pthread_mutex_lock(&mtx); //Блокировка мьютекса
    while (completed_crews < num_of_crews) {
        pthread_cond_wait(&cond, &mtx); // ожидание завершения всех групп
    }
    pthread_mutex_unlock(&mtx);//разблокировка мьютекса



    pthread_exit(NULL);
}

int main() {
    pthread_t control_thread;
    pthread_create(&control_thread, NULL, johnSilver, NULL);

    pthread_join(control_thread, NULL);

    return 0;
}