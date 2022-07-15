local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

local startup_apps = {
    "numlockx", -- Enable numpad in X
	"udiskie",
	"picom",
    "/usr/lib/polkit-kde-authentication-agent-1",
	-- "xidlehook --not-when-fullscreen --not-when-audio  --timer 300 'xbacklight -set 1'" ..
        -- " 'xbacklight -set 50' --timer 60 'xbacklight -set 50;" .. apps.lock_screen ..
        -- " ' '' --timer 900 'systemctl suspend'  ''",
    "nitrogen --restore&",
    "flameshot",
    "synclient VertScrollDelta=-79",
    "synclient HorizScrollDelta=-79",
    "synclient TapButton1=1",
    "xset r rate 300 80",
    "sh -c exec --no-startup-id /usr/lib/pam_kwallet_init"
}


local spawn_once = function (cmd)
	local findme = cmd
    local firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.easy_async_with_shell(
        string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd),
        function(_, stderr)
            if not stderr or stderr == '' then
                return
            end
            if string.find(cmd, "nitrogen") then
                return
            end
            naughty.notify({
                app_name = 'Startup Applications',
				image = beautiful.icon_noti_error,
                fg = beautiful.fg_urgent,
                title = "Error starting application",
                message = "Error while starting \"" .. cmd .. "\"",
                timeout = 10,
                icon = beautiful.icon_noti_error,
            })
        end
    )
end

for _, app in ipairs(startup_apps) do
	spawn_once(app)
end

