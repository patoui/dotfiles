local luasnip = require("luasnip")
local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("php", {
	s(
		"pubm",
		fmt(
			[[
public function {}({}): {}
{{
    {}
}}
]],
			{ i(1, "name"), i(2, "parameters"), i(3, "return type"), i(4, "body") }
		)
	),
	s(
		"prom",
		fmt(
			[[
protected function {}({}): {}
{{
    {}
}}
]],
			{ i(1, "name"), i(2, "parameters"), i(3, "return type"), i(4, "body") }
		)
	),
	s(
		"prim",
		fmt(
			[[
private function {}({}): {}
{{
    {}
}}
]],
			{ i(1, "name"), i(2, "parameters"), i(3, "return type"), i(4, "body") }
		)
	),
})
