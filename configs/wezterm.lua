local wezterm = require 'wezterm';

return {
    font = wezterm.font_with_fallback({"Fira Code", "Monaco", "Inconsolata"}),
    font_size = 16.0,
    color_scheme = "Gruvbox Dark",
}
