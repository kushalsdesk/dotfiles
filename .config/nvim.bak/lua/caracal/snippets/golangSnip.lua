local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define snippets for Go filetype
ls.add_snippets("go", {

	-- NOTE: Boilerplate for main function
	s("funmain", {
		t({
			"package main",
			"",
			'import "fmt"',
			"",
			"func ",
		}),
		i(1, "main"), -- First cursor position with default value "main"
		t({ "()" }),
		t({
			" {",
			'    fmt.Println("")',
			"}",
		}),
	}),
})
