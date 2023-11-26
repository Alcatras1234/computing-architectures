import subprocess
import unittest

class TestAssemblerProgram(unittest.TestCase):
    def test_assembler_program(self):
        # Путь к вашему исполняемому файлу RARS
        rars_path = 'C:\HSE\Second COurse HSe\ABC\ИДЗ_3\rars1_6.jar'

        # Путь к вашей программе на ассемблере RISC-V
        assembler_program_path = 'C:\HSE\Second COurse HSe\ABC\ИДЗ_3\scr\main.asm'

        # Команда для запуска программы на ассемблере RISC-V в RARS
        command = f'java -jar {rars_path} nc {assembler_program_path}'

        file_path = "C:\HSE\Second COurse HSe\ABC\ИДЗ_3\scr\output.txt"

        # Запуск программы на ассемблере через RARS
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        expected_output = "72e108108o 87o114108100 ! 100106107103100102106 _)+_("

        with open(file_path, 'r') as file:
            program_output = file.read().strip()

        # Сравнение полученного вывода с ожидаемым результатом
        self.assertEqual(program_output, expected_output)

if __name__ == '__main__':
    unittest.main()