# Yazi File Manager - Default Keybinds

Welcome to Yazi, a lightweight and efficient command-line file manager. Below are the default keybinds to help you navigate, manage files, and perform various operations within Yazi.

## Navigation

- `j`: Move cursor down
- `k`: Move cursor up
- `h`: Move cursor to parent directory
- `l`: Move cursor to child directory
- `gg`: Move cursor to the top
- `G`: Move cursor to the bottom
- `ctrl+d`: Scroll down half a page
- `ctrl+u`: Scroll up half a page
- `H`: Go to the home directory
- `-`: Go to the last visited directory

## File Operations

- `enter`: Enter the selected directory or open the selected file
- `backspace`: Go to the parent directory
- `d`: Delete the selected file or directory (moves to trash/recycle bin if supported)
- `D`: Permanently delete the selected file or directory (bypasses trash/recycle bin)
- `y`: Yank (copy) the selected file or directory
- `x`: Cut the selected file or directory
- `p`: Paste the yanked (copied) or cut file or directory
- `r`: Rename the selected file or directory
- `a`: Create a new file
- `A`: Create a new directory
- `space`: Toggle selection

## View and Search

- `/`: Search files and directories
- `n`: Move to the next occurrence of the searched word
- `N`: Move to the previous occurrence of the searched word
- `*`: Highlight search results
- `tab`: Toggle between preview and no preview

## Other

- `q`: Quit Yazi
- `ctrl+c`: Cancel the current operation

## Example Usage

### Navigating Directories
- Use `j` and `k` to move the cursor up and down within the directory listing.
- Press `h` to move to the parent directory and `l` to move into a child directory.

### Managing Files
- To delete a file, move the cursor to the file and press `d`. This will move the file to the trash/recycle bin.
- To permanently delete a file, press `D`. This action cannot be undone.
- To cut a file, press `x`. Move to the desired location and press `p` to paste the cut file.
- To copy a file, press `y`. Move to the desired location and press `p` to paste the copied file.

### Searching and Navigating Results
- Press `/` and type the word or phrase you want to search for.
- Use `n` to navigate to the next occurrence and `N` to navigate to the previous occurrence.

### Exiting
- Press `q` to quit Yazi.
- Use `ctrl+c` to cancel any ongoing operation.


