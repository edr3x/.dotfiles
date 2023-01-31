pcall(require, "luarocks.loader")

local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened" .. (startup and " during startup!" or "!"),
        message = message
    }
end)

--beautiful.init("~/.config/awesome/themes/tokyo-darker/theme.lua")
beautiful.init("~/.config/awesome/themes/night/theme.lua")
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"

F = {}

--{{{ imports
-- autostart apps
require('config.autostart')

-- wallpaper
require('config.wallpaper')

-- layout
require('config.layout')

-- rules
require('config.rules')

-- keybindings
require('config.keybinds')

-- menu
require('ui.menu')

-- titlebar
require('ui.titlebar')

-- bar
require('ui.bar')

-- notifications
require("ui.notifications")

-- popup
require("ui.popup.action")
--}}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
