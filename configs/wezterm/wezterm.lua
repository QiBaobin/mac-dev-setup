local wezterm = require 'wezterm';

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_background_opacity = 0.7
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback {"Hack Nerd Font Mono", "Fira Code", "Monaco", "Inconsolata"}
config.font_size = 16.0
config.text_background_opacity = 1.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }

return config
