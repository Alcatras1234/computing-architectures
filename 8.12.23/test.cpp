
#include <iostream>
#include <iomanip>
#include <limits>
#include <ctime>
#include <thread>

// const unsigned int arrSize = 10;
//const unsigned int arrSize = 100000000;
//const unsigned int arrSize = 500000000;
//const unsigned int arrSize = 900000000;
const unsigned int arrSize = 100000000000;

double *A ;  //последовательность чисел a0...
double *B ;

 const int threadNumber = 1000; // Количество потоков
// const int threadNumber = 2; // Количество потоков
// const int threadNumber = 4; // Количество потоков
//const int threadNumber = 8; // Количество потоков

//стартовая функция для дочерних потоков
void sqsum(int iThread, int iTN, double *arr, int size, double *sum, double *arr1) {

    *sum = 0;

    for(int i = iThread; i < size; i+=iTN) {
        *sum += arr[i] * arr1[i];

    }

}

int main() {
    // заполнение массива A
    A = new double[arrSize];
    B = new double[arrSize];
    if(A == nullptr) {
        std::cout << "Incorrect size of vector = " << arrSize << "\n";
        return 1;
    }
    for(int i = 0; i < arrSize; ++i) {
        A[i] = double(i + 1);
        B[i] = double (arrSize - i);
    }

    std::thread *thr[threadNumber];
    double sum[threadNumber];

    clock_t start_time =  clock(); // начальное время

    // Создание потоков
    for (int i=0 ; i<threadNumber ; i++) {
        thr[i] = new std::thread{sqsum, i, threadNumber, A, arrSize, (sum+i), B};

    }

    double rez = 0.0 ; //для записи окончательного результата

    // Завершение потоков
    for (int i=0 ; i<threadNumber ; i++) {
        thr[i]->join();
        rez += sum[i];
        delete thr[i];
    }

    clock_t end_time = clock(); // конечное время

    //вывод результата
    std::cout << "Сумма квадратов = " << rez << "\n" ;
    std::cout << "Сумма квадратов = " <<
        std::setprecision(20) << rez << "\n" ;
    std::cout << "Сумма квадратов = " << std::scientific <<
        std::setprecision(std::numeric_limits<double>::digits10 + 1) << rez << "\n" ;

    std::cout << "Время счета и сборки = " << end_time - start_time << "\n";

    delete[] A;
    delete[] B;
    return 0;
}
