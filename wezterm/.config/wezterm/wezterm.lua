local wezterm = require("wezterm")
return {
	enable_tab_bar = false,

	color_scheme = "tokyonight",

	font_size = 13.0,
	font = wezterm.font("Iosevka Nerd Font"),

	text_background_opacity = 1.0,
	window_background_image = "/home/r3x/.config/awesome/themes/night/wall/0220.jpg",
	window_background_opacity = 1.0,
	window_background_image_hsb = {
		brightness = 0.6,
		hue = 1.0,
		saturation = 1.0,
	},

	default_prog = { "/usr/bin/zsh", "-l" },
}
