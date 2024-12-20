
#!/bin/bash
# Check if Zsh is installed
if ! command -v zsh >/dev/null 2>&1; then
  echo "Error: Zsh is not installed. Installing Zsh..."
  sudo dnf install -y zsh
fi

# Install Oh My Zsh (if not already installed)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/oh-my-zsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed. Skipping installation."
fi

# Set Zsh as default shell (optional)
if [[ $(echo $SHELL) != "/bin/zsh" ]]; then
  echo "Setting Zsh as default shell (requires manual confirmation)."
  chsh -s "$(which zsh)"
fi

# Clone Zsh plugins (if not already present)
plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

if [[ ! -d "$plugins_dir/zsh-autosuggestions" ]]; then
  echo "Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$plugins_dir/zsh-autosuggestions"
fi

if [[ ! -d "$plugins_dir/zsh-syntax-highlighting" ]]; then
  echo "Cloning zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$plugins_dir/zsh-syntax-highlighting"
fi

echo "Zsh setup completed! Please restart your terminal or source ~/.zshrc to apply changes."
