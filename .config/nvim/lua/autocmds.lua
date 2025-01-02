require "nvchad.autocmds"
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.blade.php",
  command = "set filetype=blade",
})

