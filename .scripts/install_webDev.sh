#!/bin/bash

# Function to install Yay or Paru


# Function to install packages using pacman or AUR helper
# install_packages() {
#     for package in "$@"; do
#         if pacman -Si $package &> /dev/null; then
#             echo "Installing $package from official repositories..."
#             sudo pacman -S --needed $package
#         else
#             echo "Installing $package from AUR..."
#             $AUR_HELPER -S --needed $package
#         fi
#     done
# }

installPackages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    echo "Installing $package..."
    # Use pacman to install the package
    sudo pacman -S --noconfirm "$package"
  done
}


# Function to download and install Warp
install_warp() {
    echo "Downloading Warp..."
    wget https://releases.warp.dev/stable/v0.2024.06.04.08.02.stable_02/warp-terminal-v0.2024.06.04.08.02.stable_02-1-x86_64.pkg.tar.zst -O /tmp/warp.pkg.tar.zst
    echo "Installing Warp..."
    sudo pacman -U /tmp/warp.pkg.tar.zst
    rm /tmp/warp.pkg.tar.zst
    echo "Warp installed."
}

# Function to install web development packages in stages
install_web_dev_packages() {
    echo "Installing required packages for Web@Dev..."

    # Stage 1: Programming Languages
    LANGUAGES=("C++" "Zig" "Rust" "Lua" "PHP" "OpenJDK" "TypeScript" "Golang")
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 
    echo ""
    for package in "${LANGUAGES[@]}"; do
      echo " - $package"
    done    
    echo ""
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 
    LANGUAGE_PACKAGES=("gcc" "zig" "rust" "lua" "php" "jdk-openjdk" "typescript" "go")
    for i in "${!LANGUAGES[@]}"; do
        install_packages ${LANGUAGE_PACKAGES[$i]}
    done


    # Additional Languages
    while true; do
        echo "-----------------------------------------------------------------" 
        echo "-----------------------------------------------------------------" 
        echo ""

        read -p "Install any additional programming languages? (y/n): " choice

        echo ""
        echo "-----------------------------------------------------------------" 
        echo "-----------------------------------------------------------------" 
        if [ "$choice" = "y" ]; then
            read -p "Enter the package name: " additional_lang
            install_packages $additional_lang
        else
            break
        fi
    done

    # Stage 2: Editors
    echo " Stage 2: Editors "
    EDITORS=("Vscode" "Neovim" "Helix")
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 
    echo ""

    echo "Select the editors to install (e.g., 1 2 3):"
    echo "1. Vscode"
    echo "2. Neovim"
    echo "3. Helix"

    echo ""
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 

    read -p "Enter the numbers of the editors to install: " editor_choices
    for choice in $editor_choices; do
        case $choice in
            1)
                install_packages "code"
                ;;
            2)
                install_packages "neovim"
                ;;
            3)
                install_packages "helix"
                ;;
            *)
                echo "Invalid choice: $choice"
                ;;
        esac
    done

    # Stage 3: Terminals
    echo "Stage 3: Terminals"
    TERMINALS=("Alacritty" "Wezterm" "Warp")
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 
    echo ""

    echo "Select the terminals to install (e.g., 1 2 3):"
    echo "1. Alacritty"
    echo "2. Wezterm"
    echo "3. Warp"

    echo ""
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 

    read -p "Enter the numbers of the terminals to install: " terminal_choices
    for choice in $terminal_choices; do
        case $choice in
            1)
                install_packages "alacritty"
                ;;
            2)
                install_packages "wezterm"
                ;;
            3)
                install_warp
                ;;
            *)
                echo "Invalid choice: $choice"
                ;;
        esac
    done

    # Stage 4: LSPs (using Yay or Paru)
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 
    echo ""

    echo "Stage 4: Language Servers (LSPs)"
    echo "tsserver, gopls, rust-analyzer, rustup, luals, delve, composer "
    echo ""
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 

    echo "Using AUR_Helpers to install LSPs"
    LSP_PACKAGES=("typescript-language-server" "gopls" "rust-analyzer" "lua-language-server" "delve" "composer" "rustup" )
    for package in "${LSP_PACKAGES[@]}"; do
        install_packages $package
    done
}



# Main script execution
install_web_dev_packages

