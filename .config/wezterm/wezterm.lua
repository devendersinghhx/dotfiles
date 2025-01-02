local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font Settings
config.font_size = 14
config.line_height = 1
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}
config.color_scheme = "Catppuccin Mocha"

-- Appearance
config.window_decorations = "TITLE | RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.initial_cols = 130
config.initial_rows = 30

-- Miscellaneous settings
config.max_fps = 144
config.prefer_egl = true
config.window_background_opacity = 1
config.enable_kitty_graphics = true
config.automatically_reload_config = true

-- Toggle FullScreen
config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
