local awful = require("awful")

awful.layout.layouts = {
        awful.layout.suit.fair,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.spiral,
        awful.layout.suit.tile.left,
        awful.layout.suit.max,
        awful.layout.suit.tile,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.tile.top,
        awful.layout.suit.floating,
        --awful.layout.suit.spiral.dwindle,
        --awful.layout.suit.max.fullscreen,
        --awful.layout.suit.magnifier,
        --awful.layout.suit.corner.nw,
}
