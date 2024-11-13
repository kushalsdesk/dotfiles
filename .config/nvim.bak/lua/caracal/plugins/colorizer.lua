return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
			html = { mode = "background" },
		}, { mode = "foreground" })
	end,
}
