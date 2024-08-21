return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets", -- Optional: to use pre-existing snippets
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/caracal/snippets/" })
	end,
}
