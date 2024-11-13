
#!/bin/bash

# Function to check for Copr plugin, which is Fedora's community repo manager
install_copr_plugin() {
    if ! command -v dnf &>/dev/null; then
        echo "dnf is not installed. This script is meant for Fedora-based systems."
        exit 1
    fi

    if ! rpm -qa | grep -qw 'dnf-plugins-core'; then
        echo "Installing dnf-plugins-core for Copr support..."
        sudo dnf install -y dnf-plugins-core
    fi
}

# Function to install packages using dnf or Copr
install_packages() {
    for package in "$@"; do
        echo "Attempting to install $package..."
        if sudo dnf info "$package" &>/dev/null; then
            echo "Installing $package from official repositories..."
            sudo dnf install -y "$package"
        else
            echo "$package not found in official repositories. Please check Fedora COPR or other options."
        fi
    done
}

# Function to install Warp (not available directly in Fedora repos)
install_warp() {
    echo "Downloading Warp..."
    wget https://releases.warp.dev/stable/v0.2024.06.04.08.02.stable_02/warp-terminal-v0.2024.06.04.08.02.stable_02-1-x86_64.rpm -O /tmp/warp.rpm
    echo "Installing Warp..."
    sudo dnf install -y /tmp/warp.rpm
    rm /tmp/warp.rpm
    echo "Warp installed."
}

# Main function to install web development packages in stages
install_web_dev_packages() {
    echo "Installing packages for Web Development setup..."

    # Stage 1: Programming Languages
    LANGUAGES=("C++" "Zig" "Rust" "Lua" "PHP" "OpenJDK" "TypeScript" "Golang")
    LANGUAGE_PACKAGES=("gcc-c++" "zig" "rust" "lua" "php" "java-latest-openjdk" "typescript" "golang")
    echo "Programming Languages:"
    for i in "${!LANGUAGES[@]}"; do
        echo "Installing ${LANGUAGES[$i]} (${LANGUAGE_PACKAGES[$i]})"
        install_packages "${LANGUAGE_PACKAGES[$i]}"
    done

    # Additional Languages
    while true; do
        read -p "Install additional programming languages? (y/n): " choice
        if [[ "$choice" = "y" ]]; then
            read -p "Enter the package name: " additional_lang
            install_packages "$additional_lang"
        else
            break
        fi
    done

    # Stage 2: Editors
    echo "Stage 2: Editors"
    EDITORS=("Vscode" "Neovim" "Helix")
    echo "Select the editors to install (e.g., 1 2 3):"
    echo "1. Vscode"
    echo "2. Neovim"
    echo "3. Helix"
    read -p "Enter the numbers of the editors to install: " editor_choices
    for choice in $editor_choices; do
        case $choice in
            1)
                install_packages "code"  # VSCode may require additional repo
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
    echo "Select the terminals to install (e.g., 1 2 3):"
    echo "1. Alacritty"
    echo "2. Wezterm"
    echo "3. Warp"
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

    # Stage 4: LSPs
    echo "Stage 4: Language Servers (LSPs)"
    LSP_PACKAGES=("typescript-language-server" "gopls" "rust-analyzer" "lua-language-server" "delve" "composer" "rustup")
    for package in "${LSP_PACKAGES[@]}"; do
        install_packages "$package"
    done
}

# Main script execution
install_copr_plugin
install_web_dev_packages
