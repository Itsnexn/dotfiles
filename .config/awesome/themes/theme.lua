local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local gfs = require("gears.filesystem")
local theme_dir = gfs.get_configuration_dir () .. "themes/"
local icon_dir = theme_dir .. "icons"
local cfg = require("config")
local theme = {}

theme.mode = "tokyonight"
-- Fonts
-- Font sizes are hardcoded in the file
theme.font = "SourceSansPro 14"
theme.font_normal = "SourceSansPro"
theme.font_bold = "SourceSansPro Bold"
-- theme.font_mono = "FantasqueSansMono Nerd Font"
theme.font_mono = "iosevka"
theme.nerd_font = "Hack Regular Nerd Font"
theme.font_size_small   = " 10"
theme.font_size_normal  = " 12"
theme.font_size_big     = " 14"

-- Colors Definations
local colors = {}

colors.transparent = "#00000000"

if theme.mode == "tokyonight" then
    colors.bg = "#1A1B26"
    colors.fg = "#A9B1D6"
    colors.active = "#4E5173"
    colors.gray = "#4E5173"
    colors.red = "#F7768E"
    colors.blue = "#7AA2F7"
    colors.cyan = "#4ABAAF"
    colors.green = "#9ECE6A"
    colors.yellow = "#E0AF68"
    colors.orange = colors.yellow
    colors.purple = "#9A7ECC"
else
    colors.bg = "#11111199"
    colors.fg = "#ffffff"
    colors.gray = "#282828AA"
    colors.red = "#F44747"
    colors.blue = "#1B6ACB"
    colors.green = "#2EA043"
    colors.yellow = "#F36351"
    colors.orange = "#fc9905"
end

-- better to comment where we use this colors!
theme.gray = colors.gray
theme.active = colors.active
theme.red = colors.red
theme.blue = colors.blue
theme.cyan = colors.cyan
theme.green = colors.green
theme.yellow = colors.yellow --
theme.orange = colors.orange
theme.purple = colors.purple

-- Main colors
theme.wibar_bg      = colors.bg
theme.bg_transparent = colors.transparent
theme.bg_normal     = colors.bg
theme.bg_urgent     = colors.red
theme.bg_minimize   = colors.transparent
theme.bg_inner_widget = colors.active

theme.fg_normal     = colors.fg
theme.fg_focus      = colors.purple
theme.fg_urgent     = colors.red
theme.fg_minimize   = colors.yellow

-- button colors
theme.bg_button_normal = colors.active
theme.bg_button_focus = colors.blue
theme.bg_button_success = colors.green
theme.bg_button_urgent = colors.red
theme.fg_button_normal = colors.fg
theme.fg_button_focus = colors.bg
theme.fg_button_urgent = colors.bg

--- Border colors
theme.border_normal = colors.bg
theme.border_focus  = colors.purple
theme.border_marked = colors.red

-- Tasklist colors
-- theme.bg_tasklist_active = colors.blue .. "33"
theme.bg_tasklist_active = colors.transparent
theme.bg_tasklist_inactive = colors.transparent
theme.tasklist_font = theme.font_mono .. theme.font_size_normal

-- Margins, gaps, paddings and border width
theme.btn_border_width = dpi(0)
theme.widget_border_width = dpi(2)
theme.useless_gap   = dpi(5)
theme.gap_single_client = true
theme.maximized_hide_border = true
theme.border_width  = dpi(2)
theme.button_panel_border_width = dpi(0)
theme.button_panel_border_width_active = dpi(0)
theme.widget_sep = dpi(3)

-- Icons for notifications
theme.icon_noti_error = icon_dir .. "48x48/dialog-error.svg"
theme.icon_noti_info = icon_dir .. "48x48/dialog-information.svg"

theme.icon_spaceman = icon_dir .. "spaceman.jpg"
theme.icon_brightness = icon_dir .. "brightness.svg"

-- Taglist

theme.taglist_font = theme.font
if not cfg.taglist.tags then
    theme.taglist_fg_focus = colors.purple
else
    theme.taglist_bg_focus = colors.purple
    theme.taglist_fg_focus = colors.bg
end

theme.taglist_fg_empty = colors.fg .. "a0"
theme.taglist_fg_occupied = colors.green .. "b0"
theme.taglist_fg_urgent = colors.red
theme.taglist_bg_urgent = colors.transparent
theme.taglist_spacing = dpi(0)

-- Tasklist
theme.tasklist_shape  = theme.panel_button_shape
theme.tasklist_shape_border_width = theme.button_panel_border_width
theme.tasklist_shape_border_color = theme.border_panel_button
theme.tasklist_bg_focus = colors.blue
theme.tasklist_bg_normal = colors.transparent
theme.tasklist_bg_minimize = colors.transparent

-- Notification
theme.icon_noti_close = icon_dir .. "notification-close.svg"
theme.notification_margin = dpi(10)
theme.notification_font = theme.font_mono .. theme.font_size_small
theme.notification_bg = colors.bg
theme.notification_fg = colors.fg
theme.notification_width = dpi(265)
theme.notification_max_width = dpi(265)
theme.notification_icon_size = 64
theme.notification_spacing = dpi(4)
theme.notification_border_width = 2;
theme.notification_border_color = colors.purple

-- systray
theme.bg_systray = nil
theme.systray_icon_spacing = dpi(3) -- systray icon margin

-- Menu
theme.menu_height = dpi(26)
theme.menu_width  = dpi(200)

-- Wibar
theme.wibar_height = dpi(32.5)
theme.wibar_position = "top"
theme.wibar_icon_size = dpi(16)

theme.icons = {
    battery = {
        low = "",
        low_medium = "",
        medium = "",
        medium_full = "",
        full = "",
    },

    network = {
        wireless = "",
        wired = "",
        offline = ""
    },

    brightness = "",

    volume = {
        default = "墳",
        muted = "婢"
    }
}

-- Titlebar
--- Define the image to load
theme.titlebar_close_button_normal = theme_dir .. "/titlebar/window-close-normal.svg"
theme.titlebar_close_button_focus  = theme_dir .. "/titlebar/window-close.svg"
theme.titlebar_minimize_button_normal = theme_dir .. "/titlebar/go-down.svg"
theme.titlebar_minimize_button_focus  = theme_dir .. "/titlebar/go-down.svg"

theme.titlebar_maximized_button_normal_inactive = theme_dir.."/titlebar/go-up.svg"
theme.titlebar_maximized_button_focus_inactive  = theme_dir.."/titlebar/go-up.svg"
theme.titlebar_maximized_button_normal_active = theme_dir.."/titlebar/go-up.svg"
theme.titlebar_maximized_button_focus_active  = theme_dir.."/titlebar/go-up.svg"
theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_normal = theme.fg_normal
theme.titlebar_fg_focus = theme.fg_normal

-- LayoutBox
theme.layout_floating  = theme_dir.."layouts/floating.svg"
theme.layout_max = theme_dir.."layouts/max.svg"
theme.layout_fullscreen = theme_dir.."layouts/fullscreen.svg"
theme.layout_tile = theme_dir.."layouts/tile.svg"
theme.layout_tilebottom = theme_dir.."layouts/tilebottom.svg"
theme.layout_dwindle = theme_dir.."layouts/dwindle.svg"

-- Hotkey popup
theme.hotkeys_border_width = dpi(2)
theme.hotkeys_border_color = colors.purple
theme.hotkeys_modifiers_fg = colors.red
theme.hotkeys_shape = gears.shape.rectangle

-- Tooltip
theme.tooltip_border_color = theme.border_focus
theme.tooltip_border_width = dpi(1)
theme.tooltip_bg = theme.bg_normal
theme.tooltip_fg = theme.fg_normal
theme.tooltip_font = theme.font_normal .. theme.font_size_small
theme.tooltip_shape = gears.shape.rectangle

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = ""

return theme
