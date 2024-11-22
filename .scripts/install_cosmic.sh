#!/bin/bash

# Update and upgrade the system
sudo pacman -Syu --noconfirm

# Install COSMIC Desktop Environment
echo "Installing COSMIC Desktop Environment..."
sudo pacman -S cosmic --noconfirm

# Install SDDM display manager
echo "Installing SDDM..."
sudo pacman -S sddm --noconfirm

# Enable SDDM to start on boot
echo "Enabling SDDM to start on boot..."
sudo systemctl enable sddm

# Install git for cloning repositories
echo "Installing git..."
sudo pacman -S git --noconfirm

# Clone and install the Candy theme for SDDM
echo "Installing the Candy theme for SDDM..."
# git clone https://github.com/EliverLara/candy-sddm-theme.git
# sudo mkdir -p /usr/share/sddm/themes
# sudo mv candy-sddm-theme /usr/share/sddm/themes/candy
sudo mv /sddm /usr/share/
sudo mv /sddm.conf.d /etc/

# Set Candy as the default theme in SDDM
echo "Configuring SDDM to use the Candy theme..."
sudo bash -c 'cat <<EOF >> /etc/sddm.conf
[Theme]
Current=candy
EOF'

# Optional: Additional setup for background image or theme tweaks
# Uncomment the lines below to customize the Candy theme if desired
# sudo nano /usr/share/sddm/themes/candy/theme.conf

# Reboot to apply changes
echo "Installation complete. Rebooting now..."
sudo reboot
