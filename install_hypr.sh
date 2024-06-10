#!/bin/bash

# Function to install packages
installPacmanPackages() {
  local packages=("$@")
  echo "-----------------------------------------------------------------"
  echo "-----------------------------------------------------------------"
  echo ""
  echo "Stage 1: Installing the following packages:"
  echo ""
  for package in "${packages[@]}"; do
    echo " - $package"
  done
  echo ""
  echo "-----------------------------------------------------------------"
  echo "-----------------------------------------------------------------"
  for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
  done
}
installYayPackages() {
  local packages=("$@")
  echo "-----------------------------------------------------------------"
  echo "-----------------------------------------------------------------"
  echo ""
  echo "Stage 1: Installing the following packages:"
  echo ""
  for package in "${packages[@]}"; do
    echo " - $package"
  done
  echo ""
  echo "-----------------------------------------------------------------"
  echo "-----------------------------------------------------------------"
  for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo  yay -S  "$package"
  done
}

# Update the system
echo "Updating the system..."
sudo pacman -Syu --noconfirm



packagesYay=(
    "wlogout"
    "nwg-look"
    "eww"
    "hyprshade"
);

# Define the array of packages to be installed
pacmanPackages=(
  "base-devel"
  "cmake"
  "git"
  "hyprland"
  "hyprridle"
  "hyprpaper"
  "hyprlock"
  "dunst"
  "waybar"
  "grim"
  "slurp"
  "swappy"
  "cliphist"
  "nautilus"
  "qt5-wayland"
  "qt6-wayland"
  "wofi"
  "xdg-desktop-portal-hyprland"
)

# Install dependencies
installPacmanPackages "${pacmanPackages[@]}"
installYayPackages "${packagesYay[@]}"

# # Clone and build Hyprland
# echo "Cloning and building Hyprland..."
# git clone --recursive https://github.com/hyprwm/Hyprland.git
# cd Hyprland || { echo "Failed to enter Hyprland directory"; exit 1; }
# make all
# sudo make install

# Print a success message
echo "Hyprland and dependencies have been installed successfully."

