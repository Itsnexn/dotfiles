local fs = require("gears.filesystem")
-- local naughty = require("naughty")

_G.terminal = "kitty"
_G.run_term = function (cmd)
    if not cmd then
        return 1
    end
    cmd = "'" .. cmd .. "'"
    return terminal .. " sh -c " .. cmd
end

local cfg = {}

cfg.apps = {
    terminal            = terminal,
    editor              = os.getenv("EDITOR") or "vim",
    -- browser             = os.getenv("BROWSER") or "chromium",
    browser             = "chromium",
    screenshot          = "flameshot gui",
    screenshot_screen   = "flameshot screen",
    bluetooth_manager   = "bluetoothctl",
    ftui                = run_term("ranger"),
    fgui                = "nautilus",
    menu                = fs.get_xdg_config_home() .. "/rofi/launcher/launcher.sh",
    cfg_script          = "sh ~/.local/scripts/fastasf",
    emoji               = "rofi -show emoji",
}

cfg.network = {
    wlan_interface  = "wlan0",
    eth_interface   = "eth0",
    network_manager     = "nmtui",
}

cfg.update = {
    update          = run_term("sudo pacman -Syu"),
    get_count       = "sh -c 'pacman -Qu | wc -l'"
}

cfg.taglist = {
    -- tags = {" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "},
    -- tags = {" I ", " II ", " III ", " IV ", " V ", " VI ", " VII ", " VIII ", " IX "},
    tag_selected = " ",
    tag_default = " "
}

return cfg
