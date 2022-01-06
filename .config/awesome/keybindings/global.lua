local gears = require("gears");
local awful = require("awful");
local hotkeys_popup = require("awful.hotkeys_popup")
local volume_widget = require("widgets.panel.volume")
local brightness_widget = require("widgets.panel.brightness")
local cfg = require("config")
require("awful.autofocus")


local globalkeys = gears.table.join(

    -- ========================================================
    -- -= Layout manipulation =-
    -- ========================================================

    -- ========================================================
    -- Vi Keys

    awful.key(
        { modkey, "Shift"},
        "h",
        function () awful.client.swap.bydirection("left") end,
        {description = "swap with client on the LEFT", group = "client"}
    ),

    awful.key(
        { modkey, "Shift"},
        "j",
        function () awful.client.swap.bydirection("down") end,
        {description = "swap with client on the BOTTOM", group = "client"}
    ),

    awful.key(
        { modkey, "Shift"},
        "k",
        function () awful.client.swap.bydirection("up") end,
        {description = "swap with client on the TOP", group = "client"}
    ),

    awful.key(
        { modkey, "Shift"},
        "l",
        function () awful.client.swap.bydirection("right") end,
        {description = "swap with client on the RIGHT", group = "client"}
    ),
    -- ========================================================

    -- ========================================================
    -- Focus client

    -- Vi keys
    awful.key(
        {modkey}, "h",
        function () awful.client.focus.bydirection("left") end,
        {description = "Focus client on the LEFT", group = "client"}
    ),

    awful.key(
        {modkey}, "j",
        function () awful.client.focus.bydirection("down") end,
        {description = "Focus client on the DOWN", group = "client"}
    ),

    awful.key(
        {modkey}, "k",
        function () awful.client.focus.bydirection("up") end,
        {description = "Focus client on the UP", group = "client"}
    ),

    awful.key(
        {modkey}, "l",
        function () awful.client.focus.bydirection("right") end,
        {description = "Focus client on the RIGHT", group = "client"}
    ),

    awful.key(
        {modkey}, "Tab",
        function ()
            -- awful.client.focus.history.previous()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "Focus NEXT client by index", group = "client"}
    ),

    awful.key(
        {modkey, "Shift"}, "Tab",
        function ()
            -- awful.client.focus.history.previous()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "Focus PREVIOUS client by index", group = "client"}
    ),

    -- ========================================================

    -- Screen focus
    awful.key(
        {modkey}, "n",
        function () awful.screen.focus_relative(1) end,
        {description = "focus the next screen", group = "screen"}
    ),

    awful.key(
        {modkey, "Shift"}, "n",
        function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"}
    ),

    -- Client resize master
    awful.key(
        {modkey, "Control"}, "l",
        function () awful.tag.incmwfact(0.02) end,
        {description = "Increase master width factor", group = "layout"}
    ),

    awful.key(
        {modkey, "Control"}, "h",
        function () awful.tag.incmwfact(-0.02) end,
        {description = "Decrease master width factor", group = "layout"}
    ),

    -- Client resize
    awful.key(
        {modkey, "Control"}, "j",
        function () awful.client.incwfact(0.05) end,
        {description = "Decrease master width factor", group = "layout"}
    ),

    awful.key(
        {modkey, "Control"}, "k",
        function () awful.client.incwfact(-0.05) end,
        {description = "Decrease master width factor", group = "layout"}
    ),

    -- Increase/Decrease numbers of master
    awful.key(
        {modkey, "Shift"}, "=",
        function () awful.tag.incnmaster( 1, nil, true) end,
        {description = "Increase the number of master clients", group = "layout"}
    ),

    awful.key(
        {modkey, "Shift"}, "-",
        function () awful.tag.incnmaster(-1, nil, true) end,
        {description = "Decrease the number of master clients", group = "layout"}
    ),

    -- Increase/Decrease numbers of columns
    awful.key(
        {modkey, "Control" }, "=",
        function () awful.tag.incncol( 1, nil, true)    end,
        {description = "Increase the number of columns", group = "layout"}
    ),

    awful.key(
        {modkey, "Control" }, "-",
        function () awful.tag.incncol(-1, nil, true)    end,
        {description = "Decrease the number of columns", group = "layout"}
    ),

    -- Next layout
    awful.key(
        {modkey,}, "space",
        function () awful.layout.inc(1) end,
        {description = "Select next", group = "layout"}
    ),

    -- Volume Control
    awful.key(
        {},
        "XF86AudioRaiseVolume",
        function()
            volume_widget:inc(5)
        end,
        {description = "Increase volume up by 5%", group = "hotkeys"}
    ),

    awful.key(
        {},
        "XF86AudioLowerVolume",
        function()
            volume_widget:dec(5)
        end,
        {description = "Decrease volume up by 5%", group = "hotkeys"}
    ),

    awful.key(
        {},
        "XF86AudioMute",
        function()
            volume_widget:toggle()
        end,
        {description = "Toggle mute", group = "hotkeys"}
    ),

    -- Brightness Control
    awful.key(
        {},
        "XF86MonBrightnessUp",
        function()
            brightness_widget:inc(5)
        end,
        {description = "Increase brightness by 5%", group = "hotkeys"}
    ),

    awful.key(
        {},
        "XF86MonBrightnessDown",
        function()
            brightness_widget:dec(5)
        end,
        {description = "Decrease brightness by 5%", group = "hotkeys"}
    ),

    awful.key(
        {"Shift"},
        "XF86MonBrightnessDown",
        function()
            brightness_widget:set(5)
        end,
        {description = "Decrease brightness by 5%", group = "hotkeys"}
    ),

    awful.key(
        {"Shift"},
        "XF86MonBrightnessUp",
        function()
            brightness_widget:set(100)
        end,
        {description = "Decrease brightness by 5%", group = "hotkeys"}
    ),

    awful.key(
        {},
        "Print",
        function() awful.spawn(cfg.apps.screenshot)
        end,
        {description = "Open screenshot tool", group = "louncher"}
    ),

    awful.key(
        {"Shift"}, "Print",
        function() awful.spawn(cfg.apps.screenshot_screen)
        end,
        {description = "Open screenshot tool", group = "louncher"}
    ),

    -- Launcher"s
    awful.key(
        {modkey }, "i",
        function()
            awful.util.spawn(cfg.apps.menu)
        end,
        {description = "Application launcher", group = "launcher"}
    ),

    awful.key(
        {modkey, "Shift"}, "i",
        function() awful.spawn(cfg.apps.cfg_script) end,
        {description = "Application launcher", group = "launcher"}
    ),

    awful.key(
        {modkey }, "\\",
        function() awful.spawn(cfg.apps.emoji) end,
        {description = "Application launcher", group = "launcher"}
    ),

    awful.key(
        {modkey,}, "Return",
        function () awful.spawn(cfg.apps.terminal) end,
        {description = "Open a terminal", group = "launcher"}
    ),

    awful.key(
        {modkey,}, "e",
        function () awful.spawn(cfg.apps.ftui) end,
        {description = "Open a TUI file manager", group = "launcher"}
    ),

    awful.key(
        {modkey, "Shift"}, "e",
        function () awful.spawn(cfg.apps.fgui) end,
        {description = "Open a GUI file manager", group = "launcher"}
    ),

    awful.key(
        {modkey,}, "b",
        function () awful.spawn(cfg.apps.browser) end,
        {description = "Open a Browser", group = "launcher"}
    ),

    awful.key(
        {modkey,}, "F1",
        hotkeys_popup.show_help,
        {description="Show help", group="awesome"}
    ),

    awful.key(
        {modkey, "Shift" }, "r",
        awesome.restart,
        {description = "Reload AwesomeWM", group = "awesome"}
    )
)

return globalkeys
