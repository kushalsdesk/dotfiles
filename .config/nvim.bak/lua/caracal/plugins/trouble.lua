return {
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>dx", "", desc = "Trouble workspace diagnostics" },
		{ "<leader>dw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
		{
			"<leader>dd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open trouble document diagnostics",
		},
		{ "<leader>dq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>dl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
		{ "<leader>dt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
	},
}
