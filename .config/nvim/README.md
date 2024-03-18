This is  a cofiguration that will supports the proper confiuration with lazy.nvim as a pakcage manager

<a id="top"></a>

# NeoVim Keybindings
- [Which Keymaps](#Which-Keymap)

## Keymap Reference Keymaps from lua/config/keymaps.lua
##### `<leader>`:->`space`, `<C>`:->`ctrl`, `<S>`:->`shift`, `<A>`:-> `alt` 

### Movement and Editing

| Mode | Keybinding | Description |
|---|---|---|
| Normal, Visual | `j` | Move down (wraps to next line) |
| Normal, Visual | `k` | Move up (wraps to previous line) |
| Normal | `<A-l>`| Move to the end of the line |
| Normal | `<leader>cc` | Clone the current line below |
| Normal | `<A-h>` | Move to the beginning of the line |
| Normal | `<C-h>` | Go to the left window |
| Normal | `<C-j>` | Go to the lower window |
| Normal | `<C-k>` | Go to the upper window |
| Normal | `<C-l>` | Go to the right window |
| Normal | `<C-Up>` | Increase window height |
| Normal | `<C-Down>` | Decrease window height |
| Normal | `<C-Left>` | Decrease window width |
| Normal | `<C-Right>` | Increase window width |
| Normal | `<A-j>` | Move the current line down |
| Normal | `<A-k>` | Move the current line up |
| Insert | `<A-j>` | Move the current line down |
| Insert | `<A-k>` | Move the current line up |
| Visual | `<A-j>` | Move the selected lines down |
| Visual | `<A-k>` | Move the selected lines up |
| Normal | `<A-h>` | Go to the Start of the line |
| Normal | `<A-l>` | Go to the End of the line |
| Normal | `<C-x>` | Imitate Backspace |
| Normal | `[b` | Go to the previous buffer |
| Normal | `]b` | Go to the next buffer |
| Normal | `<leader>bb` | Switch to the other buffer |
| Normal | `<leader>ob` | Switch to the other buffer |
| Insert, Normal | `<esc>` | Escape and clear hlsearch |

### Redraw and Search

|Mode | Keybinding | Description |
|---|---|---|
|Normal| `<leader>ur`  | Redraw / clear hlsearch / diff update |
|Normal,Visual, Insert | `n` | Next search result |
|Normal,Visual, Insert | `N` | Prev search result |

### Undo and Save

| Mode | Keybinding | Description |
|---|---|---|
| Insert    | `,, . ;` | Add undo break-points |
| Normal, Insert, Visual, Select | `<C-s>` | Save file |

### Additional Features

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>K` | Keywordprg |
| Visual | `<,>,<>` | Better indenting |
| Visual | `<C-c>` | Better copying |
| Normal | `<leader>z` | Lazy |
| Normal | `<leader>fn` | New File |
| Normal | `<leader>xl` | Location List |
| Normal | `<leader>xq` | Quickfix List |
| Normal | `[q` | Previous quickfix |
| Normal | `]q` | Next quickfix |
| Normal, Visual | `<leader>cf` | Format the current buffer or selection |


### Diagnostics

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>cd` | Open the current line's diagnostics in a floating window |
| Normal | `]d` | Go to the next diagnostic |
| Normal | `[d` | Go to the previous diagnostic |
| Normal | `]e` | Go to the next error |
| Normal | `[e` | Go to the previous error |
| Normal | `]w` | Go to the next warning |
| Normal | `[w` | Go to the previous warning |

### Toggle Options

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>uf` | Toggle auto format (global) |
| Normal | `<leader>uF` | Toggle auto format (buffer) |
| Normal | `<leader>us` | Toggle spelling |
| Normal | `<leader>uw` | Toggle word wrap |
| Normal | `<leader>uL` | Toggle relative line numbers |
| Normal | `<leader>ul` | Toggle line numbers |
| Normal | `<leader>ud` | Toggle diagnostics |
| Normal | `<leader>uc` | Toggle conceal |
| Normal | `<leader>uh` | Toggle inlay hints |
| Normal | `<leader>uT` | Toggle Treesitter highlight |
| Normal | `<leader>ub` | Toggle background |

### LazyGit

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>gg` | Open Lazygit in the root directory |
| Normal | `<leader>gG` | Open Lazygit in the current working directory |

### Quitting

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<C-q>` | Quit the current window |
| Normal | `<leader>qq` | Quit all windows |

### Inspecting Highlights

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>ui` | Inspect the highlights under the cursor |

### LazyVim Changelog

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>L` | View the LazyVim changelog |

### Floating Terminal

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>ft` | Open a floating terminal in the root directory |
| Normal | `<leader>fT` | Open a floating terminal in the current working directory |
| Normal | `<C-/>` | Open/close a floating terminal in the root directory |

### Terminal Navigation

| Mode | Keybinding | Description |
|---|---|---|
| Terminal | `<esc><esc>` | Enter Normal mode |
| Terminal | `<C-h>` | Go to the left window |
| Terminal | `<C-j>` | Go to the lower window |
| Terminal | `<C-k>` | Go to the upper window |
| Terminal | `<C-l>` | Go to the right window |
| Terminal | `<C-/>` | Close the terminal |

### Window Management

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader>ww` | Switch to the other window |
| Normal | `<leader>wd` | Close the current window |
| Normal | `<leader>w-` | Split the window below |
| Normal | `<leader>w(pipe)` | Split the window right |
| Normal | `<leader>-` | Split the window below (shorter alias) |
| Normal | `<leader>(pipe)` | Split the window right (shorter alias) |

### Tab Management

| Mode | Keybinding | Description |
|---|---|---|
| Normal | `<leader><tab>l` | Switch to the last tab |
| Normal | `<leader><tab>f` | Switch to the first tab |
| Normal | `<leader><tab><tab>` | Open a new tab |
| Normal | `<leader><tab>d` | Close the current tab |
| Normal | `<leader><tab>p` | Switch to the previous tab

<a id="Which-Keymap">


## Which-Keymap Reference Keymaps lua/plugins/which-key.lua(Activated after `<leader>`) [Go Top](#top)


### General Mappings
| Key | Function |
|---|---|
| `a` | Show Home Screen |
| `h` | Toggle Terminal |
| `z` | Toggle LazyWindows |
| `e` | Focus Explorer |
| `k` | Close current file (Kill Buffer) |
| `m` | LSP Manager (Mason) |
| `Q` | Save All and Quit |
| `r` | Reformat Code |
| `y` | Sync Source |
| `R` | Restore Buffer |

### Language Support (lspconfig)
`l` followed by:
| Key | Function |
|---|---|
|   `i` | LSP Info |
|   `r` | Rename |
|   `s` | Document Symbols |
|   `S` | Workspace Symbols |

### Telescope (Search Basis)
`f` followed by:
| Key | Function |
|---|---|
|   `c` | Colorscheme |
|   `a` | Find files |
|   `h` | Find files, Open Split |
|   `f` | Find text in current buffer |
|   `g` | Find Text Pattern (live grep) |
|   `r` | Recent Files |

### Buffer Management (Barbar)
`b` followed by:
| Key | Function |
|---|---|
|   `Ctrl+b` | Buffer List |
|   `Alt+1` | Goto buffer 1 |
|   `Alt+2` | Goto buffer 2 |
|   `Alt+0` | Last buffer |
|   `Alt+p` | Pin/Unpin buffer |
|   `Space bb` | Sort by Buffer Number |
|   `Space bd` | Sort by Directory |
|   `Space bl` | Sort by Language |
|   `Space bw` | Sort by Window Number |

### Search
`s` followed by:
| Key | Function |
|---|---|
|   `h` | Find Help |
|   `m` | Man Pages |
|   `r` | Registers |
|   `k` | Keymaps |
|   `c` | Commands |

### Terminal (ToggleTerm)
`t` followed by:
| Key | Function |
|---|---|
|   `n` | NodeJS Terminal |
|   `p` | Python Terminal |
|   `f` | Floating Terminal |
|   `h` | Horizontal Terminal |
|   `v` | Vertical Terminal |

</a>
