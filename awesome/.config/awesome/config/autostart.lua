local autostart = require("awful").spawn.with_shell

autostart("picom")
autostart('setxkbmap -option "caps:escape"')
autostart("clipmenud")
autostart("nm-applet")
autostart("xset s off")
autostart("xset -dpms")
autostart("xset s noblank")
