return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		todo_comments.setup()
	end,
}

--TODO: need to focus on the usage
--NOTE: This is better in any case
--HACK: why small codebase
--WARN: again need to revisit
--WARNING: this is not good
--PERF: perplexity
--TEST: FAILURE POINT
--OPTIMIZE: optimize the code
--BUG:  not good option
--FIX: need again another visit
--FIXME: the finishing touch
