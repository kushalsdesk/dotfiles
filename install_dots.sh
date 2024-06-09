create_dotfiles_symlink() {
    echo "Creating symlink for dotfiles..."
    DOTFILES_DIR="$HOME/.dotfiles"
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "Copying dotfiles to $DOTFILES_DIR..."
        # Copy all files and directories from the current directory to ~/.dotfiles
        mkdir -p "$DOTFILES_DIR"
        rsync -av ./ "$DOTFILES_DIR/"
    fi
    cd "$DOTFILES_DIR" || exit
    stow .
    echo "Dotfiles symlink created."
}

create_dotfiles_symlink
