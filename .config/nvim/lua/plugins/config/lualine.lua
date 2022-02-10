-- =============================================
--              -== Lualine ==-
-- =============================================
local lualine = require("lualine")

-- {{{ Extensions
local toggleterm = {
	sections = {
		lualine_a = { "filename" },
	},
	filetypes = { "toggleterm" },
}
-- }}}

-- {{{ LuaLine setup
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename", "filetype" },
		lualine_c = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp", "coc" } } },
		lualine_x = {
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = " UNIX", -- e712
					dos = " WIN", -- e70f
				},
				color = { gui = "bold" },
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { toggleterm },
})
-- }}}
