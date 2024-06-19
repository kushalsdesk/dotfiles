create_dotfiles_symlink() {
  echo "Creating symlink for dotfiles..."
  DOTFILES_DIR="$HOME/.dotfiles"

  # Assume dotfiles directory exists (as you mentioned)
  cd "$DOTFILES_DIR" || exit

  # Stow with overwrite on conflict
  stow --adopt --ignore='.scripts' .

  echo "Dotfiles symlink created (with overwrites)."
}

# Call the function
create_dotfiles_symlink

