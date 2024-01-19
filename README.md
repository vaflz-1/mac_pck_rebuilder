# Dockerized GodotPckTool Script Documentation

## Description
This script simplifies the interaction with the [Dockerized GodotPckTool](https://github.com/vaflz-1/Dockerized_GodotPckTool/tree/main) on Mac, providing an easy-to-use interface for the tool's internal functionality. It automates the process of setting up the Docker environment, managing `.pck` files, and customizing paths and file names, making the overall workflow more efficient and user-friendly. The script is primarily based on working with the `.pck` file of the licensed Steam version of the game "The Case of the Golden Idol".

## Features
- Perform a full installation including Docker setup, file extraction, and cleaning.
- Change source and destination directories for file management.
- Change the `.pck` file name for different projects.
- Reset settings to default at any time.
- Extract original files from a `.pck` file.
- Create an updated `.pck` file after modifications.
- Build Docker images with specific settings.
- Clean up Docker environment after processes.

## Usage Instructions
1. Start the script and select the preferred language (English or Russian).
2. The script will display a menu with various actions.
3. Choose the desired action by entering the corresponding number.

### Menu Options
1. Perform Full Installation
2. Change Source and Destination Directories
3. Change .pck File Name
4. Reset to Default Settings
5. Extract Original Files
6. Create Updated .pck File
7. Build Docker Image with Entry
8. Build Idle Docker Image
9. Clean Docker
10. Exit

### Configuration and Customization
The script allows you to customize the source path, destination path, and the `.pck` file name through an interactive menu. These settings are persistent across sessions thanks to a configuration file.

### Language Selection
You can choose between English and Russian at the beginning of the script. The entire interface including prompts, confirmations, and menu options will be presented in the selected language.

## Script Setup
- The script checks if Docker is installed.
- It then downloads necessary files and creates a Docker image.
- Runs the Docker container in the background.
- Manages `.pck` file operations including extraction and updating.
- Cleans up the Docker environment after the process.

## Note
- This script is intended for non-commercial use.
- Ensure you have permissions for any file operations you perform with this script.

## Disclaimer
The authors are not responsible for any damage or data loss incurred due to the use of this script. Please use it responsibly and ensure you have backups of important files.

---

# Документация к скрипту Dockerized GodotPckTool

## Описание
Этот скрипт упрощает взаимодействие с [Dockerized GodotPckTool](https://github.com/vaflz-1/Dockerized_GodotPckTool/tree/main) на Mac, предоставляя удобный интерфейс для внутреннего функционала инструмента. Скрипт автоматизирует процесс настройки среды Docker, управления `.pck` файлами и настройки путей и имен файлов, делая общий рабочий процесс более эффективным и удобным для пользователя. Скрипт в основном ориентирован на работу с `.pck` файлом лицензионной версии Steam игры "The Case of the Golden Idol".

## Возможности
- Выполнение полной установки, включая настройку Docker, извлечение файлов и очистку.
- Изменение исходных и конечных директорий для управления файлами.
- Изменение имени файла `.pck` для различных проектов.
- Сброс настроек к значениям по умолчанию в любое время.
- Извлечение оригинальных файлов из файла `.pck`.
- Создание обновленного файла `.pck` после модификаций.
- Сборка Docker образов с определенными настройками.
- Очистка среды Docker после процессов.

## Инструкции по использованию
1. Запустите скрипт и выберите предпочтительный язык (английский или русский).
2. Скрипт отобразит меню с различными действиями.
3. Выберите желаемое действие, введя соответствующий номер.

### Пункты меню
1. Выполнить полную установку
2. Изменить исходящую и конечную папки
3. Изменить имя файла .pck
4. Вернуть настройки к значениям по умолчанию
5. Извлечь оригинальные файлы
6. Создать обновленный .pck файл
7. Собрать Docker образ с вводом
8. Собрать idle Docker образ
9. Очистить Docker
10. Выйти

### Настройка и Кастомизация
Скрипт позволяет настраивать исходный путь, путь назначения и имя файла `.pck` через интерактивное меню. Эти настройки сохраняются между сеансами благодаря конфигурационному файлу.

### Выбор языка
Вы можете выбрать между английским и русским языками в начале скрипта. Весь интерфейс, включая подсказки, подтверждения и пункты меню, будет представлен на выбранном языке.

## Настройка скрипта
- Скрипт проверяет, установлен ли Docker.
- Затем скачивает необходимые файлы и создает образ Docker.
- Запускает Docker контейнер в фоновом режиме.
- Управляет операциями с файлом `.pck`, включая извлечение и обновление.
- Очищает среду Docker после процесса.

## Примечание
- Этот скрипт предназначен только для некоммерческого использования.
- Убедитесь, что у вас есть разрешения на любые операции с файлами, которые вы выполняете с помощью этого скрипта.

## Отказ от ответственности
Авторы не несут ответственности за любой ущерб или потерю данных, понесенные в результате использования этого скрипта. Пожалуйста, используйте его ответственно и убедитесь, что у вас есть резервные копии важных файлов.
