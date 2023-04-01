local autostart = require("awful").spawn.with_shell

autostart("picom")
autostart('setxkbmap -option "caps:escape"')
autostart("nm-applet")
autostart("blueman-applet")
autostart("xset s off")
autostart("xset -dpms")
autostart("xset s noblank")
autostart("xauth generate :0 . trusted")
