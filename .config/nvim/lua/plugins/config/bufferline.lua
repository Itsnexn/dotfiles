-- =============================================
--            -== Bufferline ==-
-- =============================================
local bufferline = require("bufferline")
local colors = require("tokyonight.colors").setup({})

bufferline.setup({
	options = {
		numbers = "ordinal",
		-- number_style = { "none", "none" },
		close_command = "bd! %d",
		left_mouse_command = "b! %d",
		right_mouse_command = nil,
		middle_mouse_command = nil,
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 23,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count, _, _, _)
			return string.format(" (%s)", count)
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
		-- offsets = {
		--     {
		-- filetype = "NvimTree",
		-- text = "-= File Explorer =-",
		-- text_align = "center",
		-- padding = 1,
		-- }
		-- },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = "id",
	},
	highlights = {
		fill = {
			guibg = colors.bg_dark,
		},
	},
})
