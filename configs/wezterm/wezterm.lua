local wezterm = require 'wezterm';

return {
    hide_tab_bar_if_only_one_tab = true,
    font = wezterm.font_with_fallback({"Hack Nerd Font Mono", "Fira Code", "Monaco", "Inconsolata"}),
    font_size = 16.0,
    window_background_opacity = 0.5,
    window_decorations = "NONE",
    text_background_opacity = 1.0,
    window_padding = { left = 0, right = 0, top = 50, bottom = 0, },
}
