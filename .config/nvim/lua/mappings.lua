require "nvchad.mappings"

local nomap = vim.keymap.del
local map = vim.keymap.set
-- add yours here

--NOTE: Disabling default bind
nomap("n", "<leader>e")
nomap("n", "<leader>x")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap({ "n", "t" }, "<A-i>")

-- NOTE: Headers Only
map({ "n", "x", "v" }, "<leader>b", "", { desc = "Buffer Management" })
map({ "n", "x", "v" }, "<leader>c", "", { desc = "Code Management" })
map({ "n", "x", "v" }, "<leader>d", "", { desc = "Diagnostics Management" })
map({ "n", "x", "v" }, "<leader>e", "", { desc = "NvimTree Management" })
map({ "n", "x", "v" }, "<leader>f", "", { desc = "Telescope Management" })
map({ "n", "x", "v" }, "<leader>s", "", { desc = "Split Management" })
map({ "n", "x", "v" }, "<leader>t", "", { desc = "Terminal Management" })
map({ "n", "x", "v" }, "<leader>w", "", { desc = "Workspace Management" })

map("i", "jk", "<ESC>")
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
map({ "i", "v", "n", "s" }, "<C-s>", "<CMD>w<CR>", { desc = "Saves the file", silent = true })
map("n", "<esc><esc>", ":silent nohl<CR>", { desc = "Clear the search highlights", silent = true })
map("n", ":", "<CMD>Telescope cmdline<CR>", { desc = " Command mode" })

-- NOTE: Custom Leader Movement

map("n", "<leader><leader>", "<CMD>Telescope cmdline<CR>", { desc = " Command mode" })
map("n", "<leader>x", "<CMD>close<CR>", { desc = "󰅗 Close Current Split" })

-- General Purposes
map("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>N", "<CMD>Telescope notify<CR>", { desc = "Notifications" })
map("n", "<leader>ms", "<CMD>Mason<CR>", { desc = "Mason Profile" })
map("n", "<leader>q", "<CMD>qa<CR>", { desc = "Quit" })

-- Terminal management
map({ "n", "t" }, "<C-\\>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "Vertical" }
end, { desc = "Toggle Float Terminal" })

map({ "n", "t" }, "<A-\\>", function()
  require("nvchad.term").toggle { pos = "float", id = "Float" }
end, { desc = "Toggle Float Terminal" })

-- Move Lines
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up", silent = true })
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down", silent = true })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down", silent = true })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up", silent = true })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })

-- Code Control
map({ "n", "v", "x" }, "<leader>cc", ':y+"<CR>', { desc = "Copies into System Clipboard" })
map({ "n", "v", "x" }, "<leader>cl", '<S-v>yp"<CR>', { desc = "Clones the Current Line" })

-- Cursor Movement
map({ "n", "v", "x" }, "<A-h>", "^", { desc = "Start of Line", silent = true })
map({ "n", "v", "x" }, "<A-l>", "$", { desc = "End of Line", silent = true })
map({ "i" }, "<A-h>", "<C-o>h", { desc = "previous character ", silent = true })
map({ "i" }, "<A-l>", "<C-o>l", { desc = "next character ", silent = true })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true }) -- decrement

--Nvim Tree management
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = " open NvimTree", silent = true }) -- toggle file explorer
map(
  "n",
  "<leader>ef",
  "<cmd>NvimTreeFindFileToggle<CR>",
  { desc = "󰙅 Toggle file explorer on current file", silent = true }
) -- toggle file explorer on current file

map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "󰙅 Collapse file explorer", silent = true }) -- collapse file explorer
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "󰙅 Refresh file explorer", silent = true }) -- refresh file explorer

-- window management
map("n", "<leader>sh", "<C-w>s", { desc = "  Split  horizontally" }) -- split window horizontally
map("n", "<leader>sv", "<C-w>v", { desc = "  Split  vertically" }) -- split window vertically
map("n", "<leader>se", "<C-w>=", { desc = " 󰅫 make  equal size" }) -- make window equal size
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "   Close current split ", silent = true }) -- close the current pane
map("n", "<leader>sI", "<cmd>resize +5<CR>", { desc = " 󰤻 Increase split height" }) -- increase height
map("n", "<leader>sD", "<cmd>resize -5<CR>", { desc = " 󰤻 Decrease split height" }) -- decrease height
map("n", "<leader>si", "<cmd>vertical resize +15<CR>", { desc = " 󰤼 Increase split width" }) -- increase width
map("n", "<leader>sd", "<cmd>vertical resize -15<CR>", { desc = " 󰤼 Decrease split width" }) -- decrease width

-- buffer management
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Telescope View(buffers) ", silent = true })
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Open new buffer", silent = true }) -- open new buffer
map("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close current buffer", silent = true }) -- close current buffer
map("n", "<leader>bk", "<cmd>bnext<CR>", { desc = "Go to next buffer", silent = true }) -- go to next buffer
map("n", "<leader>bj", "<cmd>bprev<CR>", { desc = "Go to previous buffer", silent = true }) -- go to previous buffer
map("n", "<leader>bf", "<cmd>bfirst<CR>", { desc = "Go to first buffer ", silent = true }) -- go to first buffer
map("n", "<leader>bl", "<cmd>blast<CR>", { desc = "Go to last buffer", silent = true }) -- go to last buffer

-- Session Management
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Saves the current session" })
map("n", "<leader>ww", "<cmd>SessionRestore<CR>", { desc = "Restores the previous session" })
