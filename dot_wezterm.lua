local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'nord'
config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font Mono',
  'FiraMono Nerd Font Mono',
  'JetBrains Mono'
}

return config
