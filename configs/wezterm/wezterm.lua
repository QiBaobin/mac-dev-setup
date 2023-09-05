local wezterm = require 'wezterm';
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback {"Hack Nerd Font Mono", "Input Mono", "Fira Code", "Inconsolata", "Monaco"}
config.font_size = 16.0
config.command_palette_font_size = 16.0
config.window_background_opacity = 0.9
config.text_background_opacity = 1.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }
config.color_scheme = 'DanQin (base16)'

config.keys = {
  {
    key = 'r',
    mods = 'CTRL|SHIFT',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
      timeout_milliseconds = 2000,
    },
  },
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = act.ActivateKeyTable {
      name = 'spawn_pane',
    },
  },
  {
    key = 'Space',
    mods = 'CTRL',
    action = act.PaneSelect,
  },
  {
    key = 'Space',
    mods = 'CTRL|ALT',
    action = act.PaneSelect {
        mode = 'SwapWithActive',
    },
  },
}

config.key_tables = {
  resize_pane = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'Escape', action = 'PopKeyTable' },
  },

  spawn_pane = {
    { key = 'h', action = act.SplitPane { direction = 'Left', } },
    { key = 'l', action = act.SplitPane { direction = 'Right', } },
    { key = 'k', action = act.SplitPane { direction = 'Up', } },
    { key = 'j', action = act.SplitPane { direction = 'Down', } },
    { key = 'Escape', action = 'PopKeyTable' },
  },
}
return config
