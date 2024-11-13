local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "caracal.plugins" },
	{ import = "caracal.plugins.lsp" },
	{ import = "caracal.plugins.colorscheme" },
}, {
	change_detection = {
		notify = false,
	},
})

-- -- Function to load and apply a theme
local function load_theme(theme_name)
	require("lazy").load({ plugins = theme_name })
	vim.cmd.colorscheme(theme_name)
end
--
-- Set your theme here
load_theme("tokyonight") -- or "tokyonight", "catppuccin", "onedark"
