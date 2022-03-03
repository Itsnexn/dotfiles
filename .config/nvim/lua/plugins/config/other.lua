-- =============================================
--              -== Other Cfg ==-
-- =============================================
local g = vim.g
local colors = require("tokyonight.colors").setup({})
local zmode = require("zen-mode")

-- {{{ Vim Commentary
g.commenter_comment_empty = false
-- }}}

-- {{{ Vim Match-Up setting
g.loaded_matchit = true
g.matchup_matchparen_singleton = false
g.matchup_matchparen_offscreen = { method = "popup" }
-- g.matchup_delim_stopline = 1500
-- g.matchup_matchparen_stopline = 400
-- }}}

-- {{{ Nvim Surround
require("surround").setup({
	context_offset = 100,
	load_autogroups = false,
	mappings_style = "sandwich",
	map_insert_mode = true,
	quotes = { "'", '"' },
	brackets = { "(", "{", "[" },
	pairs = {
		nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" } },
		linear = { { "'", "'" }, { "`", "`" }, { '"', '"' } },
	},
	prefix = "s",
})
-- }}}

-- {{{ Vim better whitespace
vim.cmd("highlight ExtraWhitespace guibg=" .. colors.red)
g.better_whitespace_enabled = true
g.strip_whitespace_on_save = true
g.better_whitespace_filetypes_blacklist = { "dashboard" }
-- }}}

-- {{{ Vim Wiki
g.vimwiki_list = {
	{
		path = "~/Documents/Notes/",
		syntax = "markdown",
		ext = ".md",
		template_path = "~/.config/nvim/other/templates/",
		template_default = "default",
		template_ext = ".html",
		path_html = "~/Documents/Notes/html",
		custom_wiki2html = "vimwiki_markdown",
		html_filename_parameterization = 1,
		css_name = nil,
	},
}
vim.cmd("autocmd FileType vimwiki nnoremap <buffer> <Leader>wx :VimwikiToggleListItem<CR>")
-- }}}

-- {{{ ZenMode
zmode.setup({
	window = {
		backdrop = 1,
		options = {
			signcolumn = "yes",
			list = false,
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false,
			showcmd = false,
		},
		twilight = { enabled = false },
		gitsigns = { enabled = true },
		tmux = { enabled = true },
		kitty = {
			enabled = true,
			font = "+2",
		},
	},
})
-- }}}
