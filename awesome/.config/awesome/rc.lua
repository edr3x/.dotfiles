pcall(require, "luarocks.loader")

local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors,
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then
            return
        end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err),
        })
        in_error = false
    end)
end
-- }}}

local theme = dofile(os.getenv("HOME") .. "/.config/awesome/themes/night/theme.lua")

beautiful.init(theme)

terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"

F = {}

--{{{ imports
-- autostart apps
require("config.autostart")

-- wallpaper
require("config.wallpaper")

-- layout
require("config.layout")

-- rules
require("config.rules")

-- keybindings
require("config.keybinds")

-- menu
require("ui.menu")

-- titlebar
require("ui.titlebar")

-- bar
require("ui.bar")

-- notifications
require("ui.notifications")
--}}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate({ context = "mouse_enter", raise = false })
end)
