-- =============================================
--            -== Bufferline ==-
-- =============================================
local bufferline = require('bufferline')

bufferline.setup {
  options = {
    numbers =  "ordinal",
    -- number_style = { "none", "none" },
    close_command = "bd! %d",
    left_mouse_command = "b! %d",
    right_mouse_command = nil,
    middle_mouse_command = nil,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 23,
    diagnostics = "coc",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, _, _, _)
        return string.format("(%s)", count)
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      -- if vim.bo[buf_number].filetype ~= "<filetype-I-dont-want>" then
      --   return true
      -- end
      -- filter out by buffer name
      -- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
      --   return true
      -- end
    -- end,
    offsets = {
        {
            filetype = "NvimTree",
            text = "-= File Explorer =-",
            text_align = "center"}
        },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thick",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'id',
},
}

-- Leader n -> jump to tab n
vim.api.nvim_set_keymap('n', "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

-- Tab and Shift-Tab -> Cycle in the tabs
vim.api.nvim_set_keymap('n', "<leader><Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader><S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Leader-C-[j,k] -> Move the tabs
vim.api.nvim_set_keymap('n', "<leader><c-j>", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader><c-k>", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })

