-- =============================================
--         -== NVim Run Command's ==-
-- =============================================

local o = vim.opt
local g = vim.g
local colors = require("tokyonight.colors").setup({})
local bind = vim.api.nvim_set_keymap

g.mapleader = " " -- Leader.
o.termguicolors = true -- Gui Colors. !IMPORTANT
o.clipboard = "unnamedplus" -- Set clipboard.
o.encoding = "UTF-8" -- Text Encoding.
o.mouse = "a" -- Enable mouse in all modes.
o.completeopt = "menu,menuone,noselect" -- required by cmp

vim.cmd([[
set path+=**/*

autocmd Filetype html setlocal ts=2 sw=2 sts=4
autocmd Filetype css setlocal ts=2 sw=2 sts=4
autocmd Filetype makefile setlocal ts=8 sw=8 sts=4

command Format :lua vim.lsp.buf.formatting_sync()
]])

-- Theme {{{
g.tokyonight_style = "night"
g.tokyonight_italic_comments = 1
g.tokyonight_italic_functions = 1
g.tokyonight_dark_sidebar = 0
g.tokyonight_transparent_sidebar = 1
g.tokyonight_terminal_colors = 0
g.tokyonight_dark_float = 0

vim.cmd("colorscheme tokyonight")
vim.cmd("highlight CursorLineNr term=bold guifg=" .. colors.yellow)
vim.cmd("highlight RunitPrompt term=bold guifg=" .. colors.green)
vim.cmd("highlight Wildmenu term=bold guifg=" .. colors.red)
-- }}}

-- Status bar {{{
o.showmode = false
o.laststatus = 2
o.cmdheight = 1
o.showcmd = true
-- }}}

-- Main Area {{{
-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 3
o.signcolumn = "yes:1"
-- Text
o.wrap = true
o.colorcolumn = "80"
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.scrolloff = 6
o.smartindent = true
o.smartcase = true -- Smart case search
o.hidden = true
o.cursorline = true
o.hlsearch = true
o.ignorecase = true
o.wildmenu = true
o.wildmode = { "full" }
o.pumheight = 15
-- }}}

-- Splits {{{
o.splitbelow = true
o.splitright = true
-- }}}

bind("c", "W!", "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", { noremap = true })
bind("c", "syntax", "<cmd>Telescope filetypes<CR>", {})
