-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.check_for_updates = false
-- Force XWayland backend to bypass native Wayland protocol panics
-- config.enable_wayland = false
config.front_end = "WebGpu" -- WebGPU for most modern alternative

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- Builtin Solarized Dark | Light
config.color_scheme = "Dark+"
wezterm.font_with_fallback({
	"JetBrainsMono NFM Medium",
	"Noto Color Emoji",
})
config.font_size = 18
-- config.default_prog = { 'wsl.exe', '--cd', '~' }
-- config.default_domain = 'WSL:archlinux'
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- optional
-- config.window_background_opacity = 0.8
config.window_close_confirmation = "NeverPrompt"
config.keys = {
	-- Bind Ctrl+Shift+W to close a split
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
}
-- wezterm.on("gui-startup", function(cmd)
-- 		local tab, pane, window = mux.spawn_window(cmd or {})
-- 		window:gui_window():maximize()
-- 	end)

-- and finally, return the configuration to wezterm
return config
