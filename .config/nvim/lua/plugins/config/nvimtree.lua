-- =============================================
--             -== NvimTree ==-
-- =============================================
local g = vim.g
local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

g.nvim_tree_icons = {
	default = "",
	symlink = "",
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	git = {
		unstaged = "",
		staged = "S ",
		unmerged = "",
		renamed = "凜",
		deleted = "﫧",
		untracked = "U",
		ignored = "﬒",
	},
}

g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_disable_window_picker = 0
g.nvim_tree_icon_padding = " "
g.nvim_tree_symlink_arrow = " >> "
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_create_in_closed_folder = 0
g.nvim_tree_refresh_wait = 500
g.nvim_tree_window_picker_exclude = {
	filetype = {
		"notify",
		"packer",
		"help",
		"toggleterm",
	},
	buftype = {
		"terminal",
	},
}

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup({
	disable_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = { "dashboard" },
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	git = {
		enable = true,
		ignore = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = true,
			list = {
				{ key = { "l", "<CR>", "<2-LeftMouse>" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = { "<2-RightMouse>", "<S-CR>", "L" }, cb = tree_cb("cd") },
				{ key = "sv", cb = tree_cb("vsplit") },
				{ key = "ss", cb = tree_cb("split") },
				{ key = "t", cb = tree_cb("tabnew") },
				{ key = "<", cb = tree_cb("prev_sibling") },
				{ key = ">", cb = tree_cb("next_sibling") },
				{ key = "<Tab>", cb = tree_cb("preview") },
				{ key = "I", cb = tree_cb("toggle_ignored") },
				{ key = "H", cb = tree_cb("toggle_dotfiles") },
				{ key = "a", cb = tree_cb("create") },
				{ key = "d", cb = tree_cb("trash") },
				{ key = "r", cb = tree_cb("rename") },
				{ key = "<C-r>", cb = tree_cb("full_rename") },
				{ key = "x", cb = tree_cb("cut") },
				{ key = "c", cb = tree_cb("copy") },
				{ key = "p", cb = tree_cb("paste") },
				{ key = "y", cb = tree_cb("copy_name") },
				{ key = "Y", cb = tree_cb("copy_path") },
				{ key = "gy", cb = tree_cb("copy_absolute_path") },
				{ key = "[c", cb = tree_cb("prev_git_item") },
				{ key = "]c", cb = tree_cb("next_git_item") },
				{ key = "-", cb = tree_cb("dir_up") },
				{ key = "o", cb = tree_cb("system_open") },
				{ key = "q", cb = tree_cb("close") },
				{ key = "g?", cb = tree_cb("toggle_help") },
			},
		},
	},
})
