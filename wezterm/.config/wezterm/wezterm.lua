local theme = require("theme")
local wezterm = require("wezterm")

return {
	enable_tab_bar = false,
	colors = theme,

	-- disable font ligatures
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	font_size = 11,
	font = wezterm.font_with_fallback({
		{ family = "Fira Code Nerd Font", weight = "Regular" },
		"Caskaydia Cove Nerd Font",
		"Iosevka Nerd Font",
	}),

	text_background_opacity = 0.7,
	window_background_opacity = 0.45,
}
