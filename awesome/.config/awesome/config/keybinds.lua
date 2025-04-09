local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local beautiful = require("beautiful")

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey }, "Return", function()
        awful.spawn(terminal)
    end, { description = "open default terminal", group = "launcher" }),

    awful.key({ modkey, "Control" }, "Return", function()
        awful.util.spawn("ghostty")
    end, { description = "open ghostty", group = "launcher" }),

    awful.key({ modkey }, "b", function()
        awful.util.spawn("firefox")
    end, { description = "open firefox", group = "launcher" }),

    awful.key({ modkey }, "v", function()
        awful.util.spawn("clipboard")
    end, { description = "open clipmenu", group = "launcher" }),

    awful.key({ altkey }, "Return", function()
        awful.util.spawn("rofi -show drun")
    end, { description = "run prompt", group = "launcher" }),

    awful.key({ modkey }, "e", function()
        awful.util.spawn("Thunar")
    end, { description = "run Thunar", group = "launcher" }),

    awful.key({ "Control", altkey, "Shift" }, "l", function()
        awful.util.spawn("lock")
    end, { description = "lock screen", group = "launcher" }),

    awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show hotkeys", group = "awesome" }),

    awful.key({ modkey }, "w", function()
        mymainmenu:show()
    end, { description = "show main menu", group = "awesome" }),

    awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

    awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

    -- brightness
    awful.key({}, "XF86MonBrightnessUp", function()
        awful.util.spawn("brightnessctl set +5%")
    end, { description = "Increase Brightness", group = "control" }),

    awful.key({}, "XF86MonBrightnessDown", function()
        awful.util.spawn("brightnessctl set 5%-")
    end, { description = "Decrease Brightness", group = "control" }),

    -- Audio
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn("pamixer -i 5")
    end, { description = "increase volume", group = "control" }),

    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn("pamixer -d 5")
    end, { description = "decrease volume", group = "control" }),

    awful.key({}, "XF86AudioMute", function()
        awful.spawn("pamixer -t")
    end, { description = "mute volume", group = "control" }),

    awful.key({ modkey, "Control" }, "v", function()
        awful.spawn("pavucontrol")
    end, { description = " Audio Contol all ", group = "control" }),

    awful.key({ modkey }, "Pause", function()
        awful.spawn("mic-toggle")
    end, { description = "Microphone toggle", group = "control" }),

    -- Screenshot
    awful.key(
        { modkey },
        "Print",
        scrot_full,
        { description = "Take a screenshot of entire screen", group = "screenshot" }
    ),
    awful.key({}, "Print", scrot_selection, { description = "Take a screenshot of selection", group = "screenshot" }),

    awful.key(
        { "Control" },
        "Print",
        scrot_selection_and_edit,
        { description = "Take a screenshot of selection and edit", group = "screenshot" }
    ),

    -- Display
    awful.key({ modkey, "Control" }, "p", function()
        awful.util.spawn('xrandr --output "eDP-1" --auto')
    end, { description = "duplicate screen", group = "display" })
)

globalkeys = gears.table.join(
    globalkeys,
    -- Switch to the previous tag
    awful.key({ modkey, altkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),

    -- Switch to the next tag
    awful.key({ modkey, altkey }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),

    -- Go back to the tag
    awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" })
)

-- Focus related keybindings
globalkeys = gears.table.join(
    globalkeys,

    awful.key({ modkey }, "j", function()
        awful.client.focus.byidx(1)
    end, { description = "focus next by index", group = "client" }),
    awful.key({ modkey }, "k", function()
        awful.client.focus.byidx(-1)
    end, { description = "focus previous by index", group = "client" }),
    awful.key({ altkey }, "Tab", function()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end, { description = "go back", group = "client" }),

    awful.key({ modkey }, "h", function()
        awful.screen.focus_relative(1)
    end, { description = "focus the next screen", group = "screen" }),

    awful.key({ modkey }, "l", function()
        awful.screen.focus_relative(-1)
    end, { description = "focus the previous screen", group = "screen" }),

    awful.key({ modkey, "Control" }, "n", function()
        local c = awful.client.restore()
        if c then
            c.minimized = false
        end
    end, { description = "restore minimized", group = "client" })
)

-- Layout related keybindings
globalkeys = gears.table.join(
    globalkeys,

    awful.key({ modkey, "Shift" }, "j", function()
        awful.client.swap.byidx(1)
    end, { description = "swap with next client by index", group = "client" }),

    awful.key({ modkey, "Shift" }, "k", function()
        awful.client.swap.byidx(-1)
    end, { description = "swap with previous client by index", group = "client" }),

    awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

    awful.key({ modkey }, "l", function()
        awful.tag.incmwfact(0.05)
    end, { description = "increase master width factor", group = "layout" }),

    awful.key({ modkey }, "h", function()
        awful.tag.incmwfact(-0.05)
    end, { description = "decrease master width factor", group = "layout" }),

    awful.key({ modkey, "Shift" }, "h", function()
        awful.tag.incnmaster(1, nil, true)
    end, { description = "increase the number of master clients", group = "layout" }),

    awful.key({ modkey, "Shift" }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end, { description = "decrease the number of master clients", group = "layout" }),

    awful.key({ modkey, "Control" }, "h", function()
        awful.tag.incncol(1, nil, true)
    end, { description = "increase the number of columns", group = "layout" }),

    awful.key({ modkey, "Control" }, "l", function()
        awful.tag.incncol(-1, nil, true)
    end, { description = "decrease the number of columns", group = "layout" }),

    awful.key({ modkey }, "space", function()
        awful.layout.inc(1)
    end, { description = "select next", group = "layout" }),

    awful.key({ modkey, "Shift" }, "space", function()
        awful.layout.inc(-1)
    end, { description = "select previous", group = "layout" })
)

-- window related keybinds
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key({ altkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end, { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ altkey, "Control" }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end, { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ altkey, "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end, { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ altkey, "Control", "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end, { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientkeys = gears.table.join(
    awful.key({ altkey }, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift" }, "x", function(c)
        c:kill()
    end, { description = "close", group = "client" }),
    awful.key(
        { modkey, "Control" },
        "space",
        awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }
    ),
    awful.key({ modkey, "Control" }, "Return", function(c)
        c:swap(awful.client.getmaster())
    end, { description = "move to master", group = "client" }),
    awful.key({ modkey }, "o", function(c)
        c:move_to_screen()
    end, { description = "move to another screen", group = "screen" }),
    awful.key({ modkey }, "t", function(c)
        c.ontop = not c.ontop
    end, { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey }, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, { description = "minimize", group = "client" }),

    awful.key({ modkey }, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, { description = "minimize", group = "client" }),

    awful.key({ modkey }, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end, { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end, { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift" }, "m", function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end, { description = "(un)maximize horizontally", group = "client" })
)

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function()
        mymainmenu:toggle()
    end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    },

    -- Add titlebars to normal clients and dialogs
    { rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}
