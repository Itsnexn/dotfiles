-- =============================================
--           -== Nvim IndentLine ==-
-- =============================================

local indentLine = require("indent_blankline")
local g = vim.g
local o = vim.opt

o.list = true
-- o.listchars:append("space:⋅")

g.indent_blankline_space_char_blankline = " "
g.indent_blankline_filetype_exclude = {
	"NvimTree",
	"help",
	"dashboard",
	"lsp-installer",
	"Trouble",
	"Telescope",
}
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_enabled = true
g.space_char_blankline = "│"

indentLine.setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	space_char_blankline = " ",
})
