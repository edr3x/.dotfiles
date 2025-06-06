local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.confdir = os.getenv("HOME") .. "/.config/awesome/theme"
theme.wallpaper = theme.confdir .. "/wall/night.jpg"
theme.font_name = "Iosevka Nerd Font"
theme.taglist_font = "FiraCode Nerd Font, 14"
theme.background = "#1a1b26"
theme.foreground = "#c0caf5"
theme.black = "#1C252C"
theme.red = "#f7768e"
theme.green = "#9ece6a"
theme.yellow = "#e0af68"
theme.blue = "#7aa2f7"
theme.magenta = "#BC83E3"
theme.cyan = "#67AFC1"
theme.white = "#D9D7D6"
theme.blacks = "#484E5B"
theme.reds = "#F16269"
theme.greens = "#8CD7AA"
theme.yellows = "#E9967E"
theme.blues = "#79AAEB"
theme.magentas = "#C488EC"
theme.cyans = "#7ACFE4"
theme.whites = "#E5E5E5"
theme.darker_bg = "#0A1419"
theme.lighter_bg = "#162026"
theme.transparent = "#00000000"

theme.notification_icon = gears.surface.load_uncached(gfs.get_configuration_dir() .. "theme/hello.jpg")
theme.font = "Iosevka Nerd Font, Bold 10"
theme.font_name = "Iosevka Nerd Font"
theme.icon_font = "Iosevka Nerd Font"
theme.icon_font2 = "Iosevka Nerd Font"

theme.bg_normal = "#061115"
theme.bg_subtle = "#0a171c"
theme.bg_focus = "#1C252C"
theme.bg_cal = "#78B892"
theme.bg_urgent = "#DF5B61"
theme.bg_minimize = "#484e5b"
theme.bg_wibar = "#00000073"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#D9D7D6"
theme.fg_focus = "#D9D7D6"
theme.fg_urgent = "#D9D7D6"
theme.fg_minimize = "#D9D7D6"

theme.useless_gap = dpi(7)
theme.border_width = dpi(2)
theme.border_color_normal = "#505050"
theme.border_color_active = "#00CED1"
theme.border_color_marked = "#91231c"

theme.titlebar_bg_focus = theme.bg_subtle
theme.titlebar_bg_normal = theme.bg_normal

theme.taglist_fg_focus = "#8cedff"
theme.taglist_fg_occupied = "#e4ad7b"
theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_occupied = "#00000000"
theme.taglist_bg_empty = "#00000000"
theme.taglist_fg_empty = "#666666"

theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

theme.icon_theme = nil

-- Set different colors for urgent notifications.
-- rnotification.connect_signal("request::rules", function()
--     rnotification.append_rule({
--         rule = { urgency = "critical" },
--         properties = { bg = "#ff0000", fg = "#ffffff" },
--     })
-- end)

return theme
