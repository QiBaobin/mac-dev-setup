local wezterm = require 'wezterm';

return {
    hide_tab_bar_if_only_one_tab = true,
    font = wezterm.font_with_fallback({"Hack Nerd Font Mono", "Fira Code", "Monaco", "Inconsolata"}),
    font_size = 16.0,
    color_scheme = "Gruvbox Light",
    disable_default_key_bindings = false,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
    window_decorations = "NONE",
}
