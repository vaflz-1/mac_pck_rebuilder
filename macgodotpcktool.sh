#!/bin/bash

default_source_path="${PWD}/translation/files_main/"
default_destination_path="${HOME}/Library/Application Support/Steam/steamapps/common/The Case of the Golden Idol/The Case of The Golden Idol.app/Contents/Resources/extracted"
default_pck_file_name="The Case of The Golden Idol.pck"

config_file=".script_config"

current_language="eng"

save_config() {
    echo "source_path=$current_source_path" > $config_file
    echo "destination_path=$current_destination_path" >> $config_file
    echo "pck_file_name=$current_pck_file_name" >> $config_file
    echo "language=$current_language" >> $config_file
}

load_config() {
    if [[ -f $config_file ]]; then
        source $config_file
    else
        current_source_path=$default_source_path
        current_destination_path=$default_destination_path
        current_pck_file_name=$default_pck_file_name
        current_language="eng"
    fi
}

load_config

print_menu_eng() {
    clear
    echo "Select an action:"
    echo "1. Perform Full Installation"
    echo "2. Change Source and Destination Directories"
    echo "3. Change .pck File Name"
    echo "4. Reset to Default Settings"
    echo "5. Extract Original Files"
    echo "6. Create Updated .pck File"
    echo "7. Build Docker Image with Entry"
    echo "8. Build Idle Docker Image"
    echo "9. Clean Docker"
    echo "10. Exit"
}

print_menu_rus() {
    clear
    echo "Выберите действие:"
    echo "1. Выполнить полную установку"
    echo "2. Изменить исходящую папку и конечную папку назначения"
    echo "3. Изменить название .pck файла"
    echo "4. Вернуть исходное значение скрипта"
    echo "5. Достать исходные файлы"
    echo "6. Создать обновлённый .pck файл"
    echo "7. Собрать Docker образ с вводом"
    echo "8. Собрать idle Docker образ"
    echo "9. Очистить Docker"
    echo "10. Выход"
}

input_prompt_eng() {
    case $1 in
        "source_path") echo "Enter new path to the directory with files: " ;;
        "destination_path") echo "Enter new path to the destination directory for file replacement: " ;;
        "pck_file_name") echo "Enter new .pck file name, current value is $current_pck_file_name (include file extension): " ;;
    esac
}

input_prompt_rus() {
    case $1 in
        "source_path") echo "Укажите новый путь до директории с файлами: " ;;
        "destination_path") echo "Укажите новый путь конечной директории для замены файлов: " ;;
        "pck_file_name") echo "Выберите новое название файла .pck, текущее значение, укажите с расширением файла $current_pck_file_name: " ;;
    esac
}

input_prompt() {
    if [ "$current_language" == "eng" ]; then
        input_prompt_eng $1
    else
        input_prompt_rus $1
    fi
}

change_paths() {
    input_prompt "source_path"
    read current_source_path
    input_prompt "destination_path"
    read current_destination_path
    echo "New paths set."
    echo "Source folder: $current_source_path"
    echo "Destination folder: $current_destination_path"
    save_config
}

change_pck_file_name() {
    input_prompt "pck_file_name"
    read current_pck_file_name
    echo "New .pck file name set: $current_pck_file_name"
    save_config
}

reset_to_defaults() {
    current_source_path=$default_source_path
    current_destination_path=$default_destination_path
    current_pck_file_name=$default_pck_file_name
    current_language="eng"
    echo "Settings have been reset to default."
    save_config
}

full_installation() {
    if ! command -v docker &> /dev/null; then
        echo "Docker is not installed. Please install Docker from the website: https://docs.docker.com/get-docker/"
        return
    fi

    if [ ! -f "Dockerfile_idle" ]; then
        echo "Dockerfile_idle not found. Downloading from the repository..."
        wget https://github.com/vaflz-1/Dockerized_GodotPckTool/raw/main/Dockerfile_idle
    fi

    sudo docker pull ubuntu:latest
    sudo docker build -t godotpcktool-image -f Dockerfile_idle .
    docker run -d -v "${HOME}/Library/Application Support/Steam/steamapps/common/The Case of the Golden Idol/The Case of The Golden Idol.app/Contents/Resources":/app --name godotpcktool godotpcktool-image:latest
    sudo docker exec -it godotpcktool godotpcktool "$current_pck_file_name" -a e -o extracted
    cp -r "$current_source_path"* "$current_destination_path"
    sudo docker exec -it godotpcktool godotpcktool "$current_pck_file_name" -a a extracted --remove-prefix extracted
    docker stop $(docker ps -aq)
    docker system prune -a -f --volumes
    echo "DONE"
    save_config
}

extract_original_files() {
    sudo docker exec -it godotpcktool godotpcktool $current_pck_file_name -a e -o extracted
}

create_updated_pck() {
    sudo docker exec -it godotpcktool godotpcktool $current_pck_file_name -a a extracted --remove-prefix extracted
}

build_docker_image_with_entry() {
    sudo docker build -t godotpcktool-image .
}

build_idle_docker_image() {
    sudo docker build -t godotpcktool-image -f Dockerfile_idle .
}

clean_docker() {
    docker stop $(docker ps -aq)
    docker system prune -a -f --volumes
}

select_language() {
    echo "Select language / Выберите язык:"
    echo "1. English"
    echo "2. Русский"
    read -p "Enter your choice / Введите ваш выбор: " lang_choice
    case $lang_choice in
        1) selected_menu="print_menu_eng"; current_language="eng" ;;
        2) selected_menu="print_menu_rus"; current_language="rus" ;;
        *) echo "Invalid input. Please select a correct option / Неверный ввод. Пожалуйста, выберите корректный номер опции." ;;
    esac
}

select_language

while true; do
    $selected_menu
    read -p "Enter option number / Введите номер опции: " option
    case $option in
        1) full_installation ;;
        2) change_paths ;;
        3) change_pck_file_name ;;
        4) reset_to_defaults ;;
        5) extract_original_files ;;
        6) create_updated_pck ;;
        7) build_docker_image_with_entry ;;
        8) build_idle_docker_image ;;
        9) clean_docker ;;
        10) break ;;
        *) echo "Invalid input. Please select a correct option / Неверный ввод. Пожалуйста, выберите корректный номер опции." ;;
    esac
done
