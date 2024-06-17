# Function to install Yay or Paru
install_aur_helper() {
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 
    echo ""

    echo "Choose an AUR helper to install (yay or paru):"

    echo ""
    echo "-----------------------------------------------------------------" 
    echo "-----------------------------------------------------------------" 

    select helper in "yay" "paru"; do
        case $helper in
            yay)
                echo "Installing yay..."
                sudo pacman -S --needed git base-devel
                git clone https://aur.archlinux.org/yay.git
                cd yay
                makepkg -si
                cd ..
                rm -rf yay
                AUR_HELPER="yay"
                break
                ;;
            paru)
                echo "Installing paru..."
                sudo pacman -S --needed git base-devel
                git clone https://aur.archlinux.org/paru.git
                cd paru
                makepkg -si
                cd ..
                rm -rf paru
                AUR_HELPER="paru"
                break
                ;;
            *)
                echo "Invalid option. Please choose yay or paru."
                ;;
        esac
    done
}

install_packages() {
    install_aur_helper()
    for package in "$@"; do
        if pacman -Si $package &> /dev/null; then
            echo "Installing $package from official repositories..."
            sudo pacman -S --needed $package
        else
            echo "Installing $package from AUR..."
            $AUR_HELPER -S --needed $package
        fi
    done
}



packagesPacman=(
    "pacman-contrib"        # Additional utilities for pacman
    "vim"                   # Text editor
    "bluez"                 # Bluetooth protocol stack
    "bluez-utils"           # Bluetooth utilities
    "curl"                  # Network downloader
    "unzip"                 # Decompress zip files
    "dunst"                 # Notification daemon
    "starship"              # Cross-shell prompt
    "mpv"                   # Media player
    "nautilus"              # File manager for GNOME
    "mousepad"              # Simple text editor
    "noto-fonts"            # Google Noto fonts
    "otf-font-awesome"      # Font Awesome icons
    "figlet"                # Generate text banners
    "vlc"                   # Media player
    "python-pip"            # Python package installer
    "python-psutil"         # System and process utilities for Python
    "python-rich"           # Python library for rich text and formatting
    "python-click"          # Python package for creating command line interfaces
    "python-pywal"          # Python-based color scheme generator
    "python-gobject"        # Python bindings for GObject
    "pavucontrol"           # PulseAudio volume control
    "papirus-icon-theme"    # Icon theme
    "breeze-icons"          # Icon theme from KDE
    "polkit-gnome"          # PolicyKit authentication agent
    "brightnessctl"         # Adjust screen brightness
    "gum"                   # GitHub CLI tool
    "man-pages"             # Linux manual pages
    "nm-connection-editor"  # NetworkManager connection editor
    "gvfs"                  # Virtual filesystem
    "xdg-user-dirs"         # Manage user directories
    "xdg-desktop-portal-gtk"# Desktop integration portal for GTK
    "networkmanager"        # Network management
    "network-manager-applet"# Applet for NetworkManager
    "xarchiver"             # Archive manager
    "zip"                   # Compression utility
    "fuse2"                 # Filesystem in Userspace
    "gtk4"                  # GTK 4 libraries
    "libadwaita"            # Library for building modern GNOME applications
    "xdg-desktop-portal"    # Desktop integration portal
    "qalculate-gtk"         # Powerful and easy to use desktop calculator
    "imagemagick"           # Image manipulation tool
    "guvcview"              # Webcam viewer and recorder
    "jq"                    # Command-line JSON processor
    "rofi-wayland"          # Window switcher, application launcher and dmenu replacement
    "fastfetch"             # Command-line system information tool
    "blueman"               # Bluetooth manager
    "ffmpegthumbnailer"     # Create thumbnails for video files
    "unarchiver"            # Extraction tool for various archive formats
    "poppler"               # PDF rendering library
    "fd"                    # Simple, fast and user-friendly alternative to `find`
    "ripgrep"               # Line-oriented search tool
    "fzf"                   # Command-line fuzzy finder
    "xclip"                 # Command-line clipboard utility
    "gnome-characters"      # Character map application for GNOME
    "gnome-maps"            # Map application for GNOME
    "gnome-weather"         # Weather application for GNOME
    "cheese"                # Webcam application for GNOME
    "bat"                   # Cat clone with syntax highlighting and Git integration 
    "zsh"                   # zsh shell 
    "yazi"                  # Terminal file manager
    "gnu stow"
);


  echo "-----------------------------------------------------------------" 
  echo "-----------------------------------------------------------------" 
  echo ""

  echo "Installing needeed Main packages"
 
  echo ""
  echo "-----------------------------------------------------------------" 
  echo "-----------------------------------------------------------------" 

for package in "${packagesPacman[@]}"; do
    install_packages $package
done

# Manually Installing nvm....
export NVM_DIR="$HOME/.nvm"

if ! git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"; then
  echo "Error: Failed to clone NVM repository."
  exit 1
fi

cd "$NVM_DIR"

if ! git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*"); then
  echo "Error: Failed to checkout latest NVM version."
  exit 1
fi

echo "NVM successfully installed! Please restart your terminal or source ~/.nvm/nvm.sh for it to take effect. post_reboot script will set the version "

echo "Cloning the HyprDots Directory to be installed Later"
git clone https://github.com/prasanthrangan/hyprdots.git $HOME/hyDE



source ~/.dotfiles/scripts/install_webDev.sh
