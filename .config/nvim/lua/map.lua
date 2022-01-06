-- =============================================
--              -== Keyboard Cfg ==-
-- =============================================
local bind = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}


-- {{{ Better Movement
-- Move between windows
bind("n", "<c-h>", "<c-w>h", { silent = true })
bind("n", "<c-j>", "<c-w>j", { silent = true })
bind("n", "<c-k>", "<c-w>k", { silent = true })
bind("n", "<c-l>", "<c-w>l", { silent = true })

-- Window Resize
bind("n", "<C-Up>", ":resize -2<CR>", {silent = true})
bind("n", "<C-Down>", ":resize +2<CR>", {silent = true})
bind("n", "<C-Left>", ":vertical resize -2<CR>", {silent = true})
bind("n", "<C-Right>", ":vertical resize +2<CR>", {silent = true})

-- Keep it centered
bind("n", "n", "nzzzv", { noremap = true })
bind("n", "N", "Nzzzv", { noremap = true })
bind("n", "J", "mzJ`z", { noremap = true })

-- Buffers
bind("n", "<TAB>",   ":BufferLineCycleNext<CR>", default_opts)
bind("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", default_opts)
bind("n", "<S-x>",   ":Bdelete this<CR>", default_opts)

-- }}}

-- {{{ Move Lines
-- Normal mode
bind("v", "<s-j>", ':m ">+1<CR>gv=gv', { noremap = true })
bind("v", "<s-k>", ':m "<-1<CR>gv=gv', { noremap = true })
-- Insert mode
bind("i", "<c-j>", "<esc>:m .+1<CR>==i", { noremap = true })
bind("i", "<c-k>", "<esc>:m .-2<CR>==i", { noremap = true })
-- }}}

-- {{{ Dashboard
bind('n', '<leader>d',  ':Dashboard<CR>', default_opts)
-- }}}

-- {{{ Lsp
bind("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", default_opts)
bind("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)
bind("n", "gr", "<cmd>Lspsaga rename<cr>", default_opts)
bind("n", "gx", "<cmd>Lspsaga code_action<cr>", default_opts)
bind("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", default_opts)
bind("n", "K",  "<cmd>Lspsaga hover_doc<cr>", default_opts)
bind("n", "<leader>o", "<cmd>Lspsaga show_line_diagnostics<cr>", default_opts)
bind("n", "<leader>>", "<cmd>Lspsaga diagnostic_jump_next<cr>", default_opts)
bind("n", "<leader<<", "<cmd>Lspsaga diagnostic_jump_prev<cr>", default_opts)
bind("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
bind("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
bind("n", "<leader>gt", "<cmd>Trouble lsp_document_diagnostics<CR>", {})
-- }}}

-- {{{ Term
bind('n', '', ':ToggleTerm<CR>', default_opts)
bind("n", "<leader>tg", "<cmd>lua _Lazygit()<CR>", default_opts)
bind("n", "<leader>tp", "<cmd>lua _Python()<CR>", default_opts)
bind("n", "<leader>r", "<cmd>lua _Run()<CR>", default_opts)
-- }}}

-- {{{ Files/Explorer
bind("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", default_opts)
bind("n", "<leader>E", ":e ~/.config/nvim/init.lua<CR>", default_opts)
-- }}}

-- {{{ Comment
bind('n', "<leader>c", "<CMD>Commentary<CR>", {})
bind('x', "<leader>c", ":Commentary<CR>", {})
-- }}}

-- {{{ Telescope
bind('c', "syntax", "<cmd>Telescope filetypes<CR>", {})
bind('n', "<leader>f", "<cmd>lua Find_files()<CR>", {})
bind('n', "<leader>h", "<cmd>Telescope help_tags<CR>", {})
bind('n', "<leader>ge", "<cmd>Telescope symbols<CR>", {})
-- }}}

-- {{{ Others
-- Nvim Specture
bind('n',
    "<leader>S", "<CMD>lua require('spectre').open()<CR>",
    { noremap = true, silent = true }
)

-- Remove my custome Placeholder: <+ something +>
bind("n", "<leader>+", "/<+.*+><CR>gnd:noh<CR>i", {})

-- Nvim Matchit
bind("n", "<c-m>", "%", {silent = true})
bind("n", "<leader>\"",":s/\\'/\"/g", {})

-- Remove Trailing Spaces
bind("n", "<leader><leader>",
[[<CMD>let _s=@/ <Bar>:%s/\s\+$//e<Bar>:let @/=_s <Bar>:echo "Trailing Spaces Has been removed!"<CR>]],
{ silent = true })

-- Sudo write trick
bind("c", "W!",
    "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!",
    { noremap = true }
)
-- }}}
