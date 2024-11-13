vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbers
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers

-- Tabs & indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.shiftround = true -- Round indent
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 2 -- Number of spaces tabs count for
opt.autoindent = true -- Copy indent from current line when starting new one

-- Search settings
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.inccommand = "nosplit" -- Preview incremental substitute

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line, or insert mode start position

-- Appearance
opt.cursorline = true -- Enable highlighting of the current line
opt.termguicolors = true -- True color support
opt.background = "dark" -- Colorschemes that can be light or dark
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Clipboard
opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- Splits
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.splitkeep = "screen" -- Keep split view

-- Session & context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" } -- Session options
opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

-- Wildmode
opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Popup menu
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

-- Wrapping
opt.wrap = true -- Enable line wrap

-- Grep
opt.grepformat = "%f:%l:%c:%m" -- Grep format
opt.grepprg = "rg --vimgrep" -- Grep program

-- Other settings
opt.autowrite = true -- Enable auto write
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- Format options
opt.mouse = "a" -- Enable mouse mode
opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- Short message options
opt.showmode = false -- Don't show mode since we have a statusline
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in ms)
opt.undofile = true -- Save undo history
opt.undolevels = 10000 -- Maximum number of undo levels
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- Minimum window width

-- Markdown settings
vim.g.markdown_recommended_style = 0 -- Disable recommended markdown settings

-- Smooth scrolling (if Neovim version >= 0.10)
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end
