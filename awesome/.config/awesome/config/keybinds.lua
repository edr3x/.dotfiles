local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
require("config.screenshot")

awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "Return", function()
        awful.spawn(terminal)
    end, { description = "open default terminal", group = "launcher" }),

    awful.key({ modkey, "Control" }, "Return", function()
        awful.util.spawn("ghostty")
    end, { description = "open ghostty", group = "launcher" }),

    awful.key({ modkey }, "c", function()
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
    end, { description = "duplicate screen", group = "display" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    -- Switch to the previous tag
    awful.key({ modkey, altkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),

    -- Switch to the next tag
    awful.key({ modkey, altkey }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),

    -- Go back to the tag
    awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
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
        -- Focus restored client
        if c then
            c:activate({ raise = true, context = "key.unminimize" })
        end
    end, { description = "restore minimized", group = "client" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
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

    awful.key({ modkey }, "h", function()
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
    end, { description = "select previous", group = "layout" }),
})

awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { altkey },
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    }),
    awful.key({
        modifiers = { altkey, "Control" },
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    }),
    awful.key({
        modifiers = { altkey, "Shift" },
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    }),
    awful.key({
        modifiers = { altkey, "Control", "Shift" },
        keygroup = "numrow",
        description = "toggle focused client on tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    }),
    awful.key({
        modifiers = { modkey },
        keygroup = "numpad",
        description = "select layout directly",
        group = "layout",
        on_press = function(index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }),
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({}, 1, function(c)
            c:activate({ context = "mouse_click" })
        end),
        awful.button({ modkey }, 1, function(c)
            c:activate({ context = "mouse_click", action = "mouse_move" })
        end),
        awful.button({ modkey }, 3, function(c)
            c:activate({ context = "mouse_click", action = "mouse_resize" })
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
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
        end, { description = "(un)maximize horizontally", group = "client" }),
    })
end)

-- Mouse binds
awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function()
        mymainmenu:toggle()
    end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext),
})
