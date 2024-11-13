
#!/bin/bash

# Function to install essential packages from the Fedora repos
install_packages() {
  echo "Updating system..."
  sudo dnf update -y
  
  echo "Installing packages from Fedora repositories..."
  for package in "$@"; do
    if ! rpm -q $package &> /dev/null; then
      echo "  - Installing $package"
      sudo dnf install -y $package
    else
      echo "  - $package is already installed"
    fi
  done
}

# Package list (Fedora alternatives for Arch packages)
packages=(
  "vim-enhanced"           # vim
  "bluez"                  # Bluetooth stack
  "bluez-tools"            # Bluetooth utilities
  "wget"                   # Download utility
  "unzip"                  # File unarchiver
  "dunst"                  # Notification daemon
  "starship"               # Prompt theme
  "mpv"                    # Media player
  "nautilus"               # File manager
  "mousepad"               # Simple text editor
  "noto-sans-fonts"        # Noto fonts
  "fontawesome-fonts"      # Font Awesome
  "fira-code-fonts"        # Fira Code (includes Nerd fonts in `fira-code-fonts` for Fedora)
  "figlet"                 # ASCII art
  "vlc"                    # Media player
  "exa"                    # Modern replacement for `ls`
  "python3-pip"            # Python package manager
  "python3-psutil"         # Process utilities
  "python3-rich"           # Python formatting
  "python3-click"          # CLI tool for Python
  "python3-pywal"          # Color scheme generator
  "python3-gobject"        # Python bindings for GObject
  "pavucontrol"            # PulseAudio Volume Control
  "tumbler"                # Thumbnail service
  "papirus-icon-theme"     # Icon theme
  "breeze-icon-theme"      # Breeze icon theme
  "polkit-gnome"           # PolicyKit authentication agent
  "brightnessctl"          # Brightness control
  "man-pages"              # Documentation
  "NetworkManager"         # Networking
  "nm-connection-editor"   # Network Manager GUI
  "gvfs"                   # Virtual file system
  "xdg-user-dirs"          # User directories
  "xdg-desktop-portal-gtk" # GTK desktop portal
  "xarchiver"              # Archive manager
  "zip"                    # Archive utility
  "fuse"                   # Filesystem utilities
  "gtk4"                   # GTK4 libraries
  "libadwaita"             # GNOME libraries
  "xdg-desktop-portal"     # Desktop portal
  "qalculate-gtk"          # Calculator
  "ImageMagick"            # Image manipulation tool
  "cheese"                 # Webcam utility
  "jq"                     # JSON processor
  "fastfetch"              # System information fetch
  "blueman"                # Bluetooth manager
  "ffmpegthumbnailer"      # Video thumbnail generator
  "poppler"                # PDF utilities
  "fd-find"                # `fd` alternative
  "ripgrep"                # Fast search
  "fzf"                    # Fuzzy finder
  "xclip"                  # Clipboard manager
  "gh"                     # GitHub CLI
  "stow"                   # Dotfile manager
  "gnome-weather"          # GNOME Weather
  "gnome-maps"             # GNOME Maps
  "gnome-characters"       # GNOME Character picker
  "auto-cpufreq"           # CPU frequency tool
)

# Install packages
install_packages "${packages[@]}"
