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
    "pacman-contrib"
    "vim"
    "bluez"
    "bluez-utils"
    "wget"
    "unzip"
    "dunst" 
    "starship"
    "mpv" 
    "nautilus" 
    "mousepad"
    "noto-fonts" 
    "otf-font-awesome" 
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd" 
    "figlet" 
    "vlc" 
    "eza" 
    "python-pip" 
    "python-psutil" 
    "python-rich" 
    "python-click" 
    "python-pywal"
    "python-gobject"
    "pavucontrol" 
    "tumbler" 
    "papirus-icon-theme"
    "breeze-icons"
    "polkit-gnome"
    "brightnessctl"
    "gum"
    "man-pages"
    "nm-connection-editor"
    "gvfs"
    "xdg-user-dirs"
    "xdg-desktop-portal-gtk"
    "networkmanager"
    "network-manager-applet"
    "xarchiver"
    "zip"
    "fuse2"
    "gtk4"
    "libadwaita"
    "xdg-desktop-portal"
    "qalculate-gtk"
    "yazi"
    "imagemagick"
    "guvcview"
    "jq"
    "rofi-wayland"
    "fastfetch"
    "blueman"
    "ffmpegthumbnailer"
    "unarchiver"
    "poppler"
    "fd"
    "ripgrep"
    "fzf"
    "xclip"
);


for package in "${packagesPacman[@]}"; do
    install_packages $package
done



