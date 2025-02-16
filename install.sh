#!/bin/bash

# Function to handle errors
error_handler() {
    echo -e "\033[31mAn error occurred. Please check the output above for details.\033[0m"
    exit 1
}

# Trap any errors
trap 'error_handler' ERR

# Function to install HTML & CSS tools
install_html_css() {
    echo -e "\033[34mInstalling HTML & CSS development tools...\033[0m"
    apt-get install -y tidy nodejs
    npm install -g stylelint
}

# Function to install Lua
install_lua() {
    echo -e "\033[34mInstalling Lua development tools...\033[0m"
    apt-get install -y lua5.3
}

# Function to install the latest Python version and pip
install_python() {
    echo -e "\033[34mInstalling latest Python version...\033[0m"
    apt-get install -y python python2 python3 python3-pip
    python3 -m pip install --upgrade pip
}

# Function to display the installation menu
show_installation_menu() {
    while true; do
        echo -e "\033[34mSelect an option to install:\033[0m"
        echo "1) C#"
        echo "2) Python (Latest + Pip)"
        echo "3) JavaScript"
        echo "4) Java"
        echo "5) PHP"
        echo "6) Ruby"
        echo "7) Go"
        echo "8) Rust"
        echo "9) HTML & CSS"
        echo "10) Lua"
        echo "11) All"
        echo "12) Exit"
        read -p "Enter option: " option

        case $option in
            1) install_csharp ;;
            2) install_python ;;
            3) install_javascript ;;
            4) install_java ;;
            5) install_php ;;
            6) install_ruby ;;
            7) install_go ;;
            8) install_rust ;;
            9) install_html_css ;;
            10) install_lua ;;
            11)
                install_csharp
                install_python
                install_javascript
                install_java
                install_php
                install_ruby
                install_go
                install_rust
                install_html_css
                install_lua
                ;;
            12)
                echo "Exiting installation menu."
                break
                ;;
            *)
                echo -e "\033[31mInvalid option: $option\033[0m"
                ;;
        esac
    done
}

if [ "$1" == "menu" ]; then
    show_installation_menu
    exit 0
fi

# Run installation menu
show_installation_menu