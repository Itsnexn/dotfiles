-- =============================================
--              -== Keyboard Cfg ==-
-- =============================================
local bind = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local wk = require("which-key")

-- {{{ Better Movement
-- Move between windows
bind("n", "<c-h>", "<c-w>h", { silent = true })
bind("n", "<c-j>", "<c-w>j", { silent = true })
bind("n", "<c-k>", "<c-w>k", { silent = true })
bind("n", "<c-l>", "<c-w>l", { silent = true })

-- Window Resize
bind("n", "<C-Up>", ":resize -2<CR>", { silent = true })
bind("n", "<C-Down>", ":resize +2<CR>", { silent = true })
bind("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
bind("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Keep it centered
bind("n", "n", "nzzzv", { noremap = true })
bind("n", "N", "Nzzzv", { noremap = true })
bind("n", "J", "mzJ`z", { noremap = true })

-- Buffers
bind("n", "<TAB>", ":BufferLineCycleNext<CR>", default_opts)
bind("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", default_opts)
bind("n", "<S-x>", ":Bdelete this<CR>", default_opts)
-- }}}

-- {{{ Move Lines
-- Normal mode
bind("v", "<S-j>", ":m '>+1<CR>gv=gv", { noremap = true })
bind("v", "<S-k>", ":m '<-2<CR>gv=gv", { noremap = true })
-- Insert mode
bind("i", "<C-j>", "<esc>:m .+1<CR>==i", { noremap = true })
bind("i", "<C-k>", "<esc>:m .-2<CR>==i", { noremap = true })
-- }}}

-- {{{ Other
bind("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
bind("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
-- }}}

-- Normal mode
wk.register({
	g = { -- LSP Actions
		name = "LSP Actions",
		d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Goto Defenition" },
		D = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
		r = { "<CMD>Lspsaga rename<CR>", "Rename" },
		["<leader>"] = { "<CMD>Lspsaga code_action<CR>", "Code Action" },
		k = { "<CMD>Lspsaga hover_doc<CR>", "Hower Doc" },
		g = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
		n = { "<CMD>Lspsaga diagnostic_jump_next<CR>", "Diagnostics Next" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostics Perv" },
		l = { "<CMD>Trouble lsp_document_diagnostics<CR>", "Diagnostics List" },
		f = { "<CMD>lua vim.lsp.buf.formatting()<CR>", "Format Buffer" },
	},
	f = { -- File Action
		name = "File Actions",
		f = { "<CMD>lua Find_files()<CR>", "Find Files" },
		e = { "<CMD>e ~/.config/nvim/init.lua<CR>", "Edit Config File" },
		n = { "<CMD>ene!<CR>", "New File" },
		h = { "<CMD>Telescope oldfiles<CR>", "Old Files" },
	},
	t = { -- ToggleTerm
		name = "Terminal",
		t = { "<CMD>ToggleTerm<CR>", "New Terminal" },
		g = { "<CMD>lua _Lazygit_toggle()<CR>", "Open LazyGit" },
		p = { "<CMD>lua _Python_toggle()<CR>", "Open Bpython" },
	},
	w = { -- Vim Wiki
		name = "Vim Wiki",
		w = { name = "Open wiki index" },
		t = { name = "Open wiki index in new tab" },
		s = { name = "Select and open wiki" },
		d = { name = "Delete Current wiki" },
		r = { name = "Rename Current wiki" },
		x = { "<CMD>VimwikiToggleListItem<CR>", "Toggle List State" },
	},
	b = {
		name = "Buffer Action",
		n = { "<CMD>BufferLineCycleNext<CR>", "Next Buffer" },
		N = { "<CMD>BufferLineCyclePerv<CR>", "Previous Buffer" },
		m = { "<CMD>BufferLineMoveNext<CR>", "Move Buffer to Right" },
		M = { "<CMD>BufferLineMovePrev<CR>", "Move Buffer to Left" },
		d = { "<CMD>Bdelete this<CR>", "Close Buffer" },
	},
	["<C-j>"] = { "<Cmd>BufferLineMovePrev<CR>", "BufferLine move to Left" },
	["<C-k>"] = { "<Cmd>BufferLineMoveNext<CR>", "BufferLine move to Right" },
	["<leader>"] = { "<CMD>StripWhitespace<CR>", "Strip Whitespaces" },
	r = { "<CMD>lua _Run()<CR>", "Shell Run" },
	h = { "<CMD>Telescope help_tags<CR>", "Help" },
	e = { "<CMD>NvimTreeToggle<CR>", "File Tree Toggle" },
	E = { "<CMD>Telescope symbols<CR>", "Emoji List" },
	s = { "<CMD>lua require('spectre').open()<CR>", "Find & Replace" },
	c = { "<CMD>Commentary<CR>", "Comment" },
}, { mode = "n", prefix = "<leader>", noremap = true, silent = true })

-- Visual mode
wk.register({
	c = { ":Commentary<CR>", "Comment" },
	g = {
		name = "LSP Actions",
		f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
	},
}, { mode = "x", prefix = "<leader>", noremap = true, silent = true })
