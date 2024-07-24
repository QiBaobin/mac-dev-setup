local wezterm = require 'wezterm';
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local shell = os.getenv 'HOME' .. '/homebrew/bin/zsh'
local f = io.open(shell, 'r')
if f ~= nil then
    f:close()
    config.default_prog = { shell }
    config.set_environment_variables = {
        SHELL = shell,
    }
end
config.hide_tab_bar_if_only_one_tab = true
local fonts = {"Cascadia Code", "Hack Nerd Font Mono", "Input Mono", "Fira Code", "Inconsolata", "Monaco", "Monaspace Neon" }
config.font = wezterm.font_with_fallback(fonts)
config.font_size = 16.0
config.command_palette_font_size = 16.0
config.window_background_opacity = 0.9
config.text_background_opacity = 1.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }

---cycle through builtin dark schemes in dark mode,
---and through light schemes in light mode
local function themeCycler(window, _)
    local allSchemes = wezterm.color.get_builtin_schemes()
    local isDark = wezterm.gui and wezterm.gui.get_appearance():find("Dark") or false
    local currentScheme = window:effective_config().color_scheme
    local darkSchemes = {}
    local lightSchemes = {}

    for name, scheme in pairs(allSchemes) do
        if name ~= currentScheme and scheme.background then
            local bg = wezterm.color.parse(scheme.background) -- parse into a color object
            ---@diagnostic disable-next-line: unused-local
            local h, s, l, a = bg:hsla() -- and extract HSLA information
            if l < 0.4 then
                table.insert(darkSchemes, name)
            else
                table.insert(lightSchemes, name)
            end
        end
    end

    local schemesToSearch = isDark and darkSchemes or lightSchemes
    local theme = schemesToSearch[math.random(#schemesToSearch)]
    local overrides = window:get_config_overrides() or {}
    overrides.color_scheme = theme
    table.insert(fonts, 1, table.remove(fonts, math.random(#fonts - 1) + 1))
    overrides.font = wezterm.font_with_fallback(fonts)
    wezterm.log_info("Switched to: " .. theme)
    window:set_config_overrides(overrides)
end

wezterm.on('window-config-reloaded', function(window, pane)
  -- If there are no overrides, this is our first time seeing
  -- this window, so we can pick a random scheme.
  if not window:get_config_overrides() then
    act.EmitEvent 'next-scheme'
    window:maximize()
  end
end)

wezterm.on('next-scheme', themeCycler)

wezterm.on('trigger-editor', function(window, pane)
  local text = pane:get_logical_lines_as_text(window:effective_config().scrollback_lines)

  -- Create a temporary file to pass to kak
  local name = os.tmpname()
  local f = io.open(name, 'w+')
  f:write(text)
  f:flush()
  f:close()

  -- Open a new window running editorand tell it to open the file
  window:perform_action(
    act.SpawnCommandInNewWindow {
      args = { os.getenv 'SHELL', '-i', '-c', 'kak ' .. wezterm.shell_quote_arg(name) },
    },
    pane
  )

  -- Wait "enough" time for kak to read the file before we remove it.
  -- The window creation and process spawn are asynchronous wrt. running
  -- this script and are not awaitable, so we just pick a number.
  --
  -- Note: We don't strictly need to remove this file, but it is nice
  -- to avoid cluttering up the temporary directory.
  wezterm.sleep_ms(1000)
  os.remove(name)
end)

config.keys = {
  -- {
  --   key = 'e',
  --   mods = 'CTRL|SHIFT',
  --   action = act.EmitEvent 'trigger-editor',
  -- },
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = act.EmitEvent 'next-scheme',
  },
  -- {
  --   key = 'r',
  --   mods = 'CTRL|SHIFT',
  --   action = act.ActivateKeyTable {
  --     name = 'resize_pane',
  --     one_shot = false,
  --     timeout_milliseconds = 2000,
  --   },
  -- },
  -- {
  --   key = 'n',
  --   mods = 'CTRL|SHIFT',
  --   action = act.ActivateKeyTable {
  --     name = 'spawn_pane',
  --   },
  -- },
  {
    key = 'Space',
    mods = 'CTRL',
    action = act.PaneSelect,
  },
  -- {
  --   key = 'Space',
  --   mods = 'CTRL|ALT',
  --   action = act.PaneSelect {
  --       mode = 'SwapWithActive',
  --   },
  -- },
}

-- config.key_tables = {
--   resize_pane = {
--     { key = 'h', action = act.AdjustPaneSize { 'Left', 5 } },
--     { key = 'l', action = act.AdjustPaneSize { 'Right', 5 } },
--     { key = 'k', action = act.AdjustPaneSize { 'Up', 5 } },
--     { key = 'j', action = act.AdjustPaneSize { 'Down', 5 } },
--     { key = 'Escape', action = 'PopKeyTable' },
--   },

--   spawn_pane = {
--     { key = 'h', action = act.SplitPane { direction = 'Left', } },
--     { key = 'l', action = act.SplitPane { direction = 'Right', } },
--     { key = 'k', action = act.SplitPane { direction = 'Up', } },
--     { key = 'j', action = act.SplitPane { direction = 'Down', } },
--     { key = 'Escape', action = 'PopKeyTable' },
--   },
-- }
return config
