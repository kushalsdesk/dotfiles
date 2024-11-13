vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>q", ":qa<CR>", { desc = "quits neovim", silent = true })
keymap.set("n", "<leader>E", ":NvimTreeFocus<CR>", { desc = "󰙅 Focus NvimTree", silent = true })
keymap.set("n", "<leader>L", ":Lazy<CR>", { desc = "󰒲 Lazy", silent = true })
keymap.set("n", "<leader>ms", ":Mason<CR>", { desc = "󰿘 Mason Profile", silent = true })
keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<CMD>w<CR>", { desc = "Saves the file", silent = true })
keymap.set("n", "<esc><esc>", ":silent nohl<CR>", { desc = "Clear the search highlights", silent = true })
keymap.set("n", ":", ":Telescope cmdline<CR>", { silent = true, noremap = true, desc = "Cmdline" })
keymap.set("n", "<leader><leader>", ":Telescope cmdline<CR>", { silent = true, noremap = true, desc = "Command Line" })

-- headers for which-key
keymap.set("n", "<leader>c", "", { desc = "Code" })
keymap.set("n", "<leader>s", "", { desc = " Split window Control" })
keymap.set("n", "<leader>b", "", { desc = "Buffer Control" })
keymap.set("n", "<leader>t", "", { desc = "Terminal Control" })
keymap.set("n", "<leader>e", "", { desc = "󰙅 Explorer NvimTree" })

-- Move Lines
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up", silent = true })
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down", silent = true })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down", silent = true })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up", silent = true })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })

-- Code Control
keymap.set({ "n", "v", "x" }, "<leader>cc", ':y+"<CR>', { desc = "Copies into System Clipboard", silent = true })
keymap.set({ "n", "v", "x" }, "<leader>cl", '<S-v>yp"<CR>', { desc = "Clones the Current Line", silent = true })

-- Cursor Movement
keymap.set({ "n", "v", "x" }, "<A-h>", "^", { desc = "Start of Line", silent = true })
keymap.set({ "n", "v", "x" }, "<A-l>", "$", { desc = "End of Line", silent = true })
keymap.set({ "i" }, "<A-h>", "<C-o>h", { desc = "previous character ", silent = true })
keymap.set({ "i" }, "<A-l>", "<C-o>l", { desc = "next character ", silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true }) -- decrement

--Nvim Tree management
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = " open NvimTree", silent = true }) -- toggle file explorer
keymap.set(
	"n",
	"<leader>ef",
	"<cmd>NvimTreeFindFileToggle<CR>",
	{ desc = "󰙅 Toggle file explorer on current file", silent = true }
) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "󰙅 Collapse file explorer", silent = true }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "󰙅 Refresh file explorer", silent = true }) -- refresh file explorer

-- window management
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "  Split  horizontally" }) -- split window horizontally
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "  Split  vertically" }) -- split window vertically
keymap.set("n", "<leader>se", "<C-w>=", { desc = " 󰅫 make  equal size" }) -- make window equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "   Close current split ", silent = true }) -- close the current pane
keymap.set(
	"n",
	"<leader>sm",
	"<cmd>MaximizerToggle<CR>",
	{ desc = "   Maximize/Minimize current split ", silent = true }
) -- Maximize/Minimize the current pane

-- buffer management
keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Telescope View(buffers) ", silent = true })
keymap.set("n", "<leader>bo", "<cmd>enew<CR>", { desc = "Open new buffer", silent = true }) -- open new buffer
keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close current buffer", silent = true }) -- close current buffer
keymap.set("n", "<leader>bk", "<cmd>bnext<CR>", { desc = "Go to next buffer", silent = true }) -- go to next buffer
keymap.set("n", "<leader>bj", "<cmd>bprev<CR>", { desc = "Go to previous buffer", silent = true }) -- go to previous buffer
keymap.set("n", "<leader>bf", "<cmd>bfirst<CR>", { desc = "Go to first buffer ", silent = true }) -- go to first buffer
keymap.set("n", "<leader>bl", "<cmd>blast<CR>", { desc = "Go to last buffer", silent = true }) -- go to last buffer

-- tab management
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm startinsert<CR>", { desc = " 󰝜 Open new terminal", silent = true }) -- open new tab
keymap.set(
	"n",
	"<leader>th",
	"<cmd>ToggleTerm size=16 direction=horizontal startinsert<cr>",
	{ desc = "Horizontal terminal", silent = true }
) -- close current tab
keymap.set(
	"n",
	"<leader>tv",
	"<cmd>ToggleTerm size=50 direction=vertical startinsert<cr>",
	{ desc = "Vertical terminal", silent = true }
) -- goto next tab
keymap.set(
	"n",
	"<leader>tf",
	"<cmd>ToggleTerm size=35 direction=float startinsert<cr>",
	{ desc = "Floating Terminal", silent = true }
) -- open current buffer un new tab
