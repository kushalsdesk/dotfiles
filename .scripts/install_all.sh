#!/bin/bash

# Function to install yay as AUR helper (optional, comment out if you already have yay)
install_yay() {
  echo "Installing yay..."
  sudo pacman -Syu --noconfirm  # Update system packages
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
}

# Function to install packages (from official repos or AUR)
install_packages() {
  # Install yay if not already available
  if ! command -v yay &> /dev/null; then
    install_yay
  fi

  echo "Packages to be installed:"
  for package in "$@"; do
    echo "  - $package"
  done

  # Loop through packages, handling errors (optional)
  for package in "$@"; do
    if pacman -Qs $package &> /dev/null; then
      echo "Installing $package from official repositories..."
      sudo pacman -S --needed --noconfirm $package
    else
      echo "Installing $package from AUR..."
      yay -S --needed --noconfirm $package
      # Add more specific error handling here (optional)
    fi
  done
}

# Package list
packages=(
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
  "ttf-maple"
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
  "cheese"
  "jq"
  "fastfetch"
  "blueman"
  "ffmpegthumbnailer"
  "unarchiver"
  "poppler"
  "fd"
  "ripgrep"
  "fzf"
  "xclip"
  "github-cli"
  "stow"
  "gnome-weather"
  "gnome-maps"
  "gnome-characters"
  "auto-cpufreq"
  "zsh"
  "zoxide"
)

# Install packages
install_packages "${packages[@]}"

