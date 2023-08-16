-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'tokyonight_storm'

config.font = wezterm.font("Iosevka Term SS07", {weight="Medium"})

config.font_size = 12
config.initial_cols = 150
config.initial_rows = 50

config.wsl_domains = wezterm.default_wsl_domains()
config.default_domain = "WSL:Ubuntu"
config.default_cursor_style = "SteadyBar"

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config

