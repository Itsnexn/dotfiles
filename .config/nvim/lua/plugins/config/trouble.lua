-- =============================================
--              -== Trouble==-
-- =============================================
local trouble = require("trouble")

trouble.setup({
	position = "bottom",
	height = 10, -- height of the trouble list when position is top or bottom
	width = 30, -- width of the list when position is left or right
	icons = true, -- use devicons for filenames
	mode = "workspace_diagnostics",
	fold_open = "", -- icon used for open folds
	fold_closed = "", -- icon used for closed folds
	group = true, -- group results by file
	padding = false, -- add an extra new line on top of the list
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠",
	},
	action_keys = {
		-- map to {} to remove a mapping, for example:
		-- close = {},
		close = "q", -- close the list
		cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
		refresh = "r", -- manually refresh
		jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
		open_split = { "<c-x>" }, -- open buffer in new split
		open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
		open_tab = { "<c-t>" }, -- open buffer in new tab
		jump_close = { "o" }, -- jump to the diagnostic and close the list
		toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
		toggle_preview = "P", -- toggle auto_preview
		hover = "K", -- opens a small popup with the full multiline message
		preview = "p", -- preview the diagnostic location
		close_folds = { "zM", "zm" }, -- close all folds
		open_folds = { "zR", "zr" }, -- open all folds
		toggle_fold = { "zA", "za" }, -- toggle fold of current file
		previous = "k", -- preview item
		next = "j", -- next item
	},
})
