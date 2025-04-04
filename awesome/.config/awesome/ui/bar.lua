local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local battary_arc = require("widgets.batteryarc")
local todo_widget = require("widgets.todo")

local time = wibox.widget({
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    {
        widget = wibox.container.margin,
        margins = 10,
        {
            widget = wibox.widget.textclock("%l:%M %p"),
            font = beautiful.font_name .. " Bold 11",
            align = "center",
        },
    },
})

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag(
        { " ", "  ", " 󰙯 ", "  ", " 󰘳 ", "  ", " 󱙋 ", " 󱘗 ", "  " },
        s,
        awful.layout.layouts[1]
    )

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
            awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
            awful.layout.inc(-1)
        end),
        awful.button({}, 5, function()
            awful.layout.inc(1)
        end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({}, 1, function(t)
                t:view_only()
            end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({}, 4, function(t)
                awful.tag.viewprev(t.screen)
            end),
            awful.button({}, 5, function(t)
                awful.tag.viewnext(t.screen)
            end),
        },
    })

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({}, 1, function(c)
                c:activate({ context = "tasklist", action = "toggle_minimization" })
            end),
            awful.button({}, 3, function()
                awful.menu.client_list({ theme = { width = 250 } })
            end),
            awful.button({}, 4, function()
                awful.client.focus.byidx(-1)
            end),
            awful.button({}, 5, function()
                awful.client.focus.byidx(1)
            end),
        },
    })

    s.mywibar = awful.wibar({
        type = "dock",
        ontop = true,
        stretch = false,
        height = dpi(38),
        width = s.geometry.width - dpi(30),
        shape = helpers.rrect(8),
        screen = s,
    })

    awful.placement.top(s.mywibar, { margins = dpi(8) })

    --{{{ Remove wibar on full screen
    local function remove_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibar.visible = false
        else
            c.screen.mywibar.visible = true
        end
    end

    local function add_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibar.visible = true
        end
    end

    ---}}}

    -- Hide bar when a splash widget is visible
    awesome.connect_signal("widgets::splash::visibility", function(vis)
        screen.primary.mywibar.visible = not vis
    end)

    client.connect_signal("property::fullscreen", remove_wibar)

    client.connect_signal("request::unmanage", add_wibar)

    -- Add widgets to the wibox
    s.mywibar:setup({
        {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                -- tags
                {
                    s.mytaglist,
                    margins = dpi(2),
                    widget = wibox.container.margin,
                },

                -- clock
                time,
                -- systray
                {
                    todo_widget(),
                    wibox.widget.systray(),
                    battary_arc({
                        show_current_level = true,
                        show_notification_mode = "on_click",
                    }),
                    layout = wibox.layout.fixed.horizontal,
                },
            },
            left = dpi(15),
            right = dpi(15),
            widget = wibox.container.margin,
        },
        shape = helpers.rrect(beautiful.border_radius),
        widget = wibox.container.background,
    })
end)
