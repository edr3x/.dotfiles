pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Enable hotkeys help widget for VIM and other apps
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("config.screenshot")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
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

-- {{{ Variable definitions

-- Initialize theme
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/night/theme.lua")
-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"
altkey = "Mod1"
-- }}}

--{{{ imports
-- autostart apps
require("config.autostart")

-- layout
require("config.layout")

-- keybinds
require("config.keybinds")

-- bar
require("ui.bar")

-- menu
require("ui.menu")

-- titlebar
require("ui.titlebar")
--}}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

-- change border colors
client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_color_active
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_color_normal
end)

-- }}}
