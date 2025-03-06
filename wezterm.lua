---@type Wezterm
local wezterm = require("wezterm")
local ui = require("ui")
local keys = require("keys")
local const = require("const")

local config = wezterm.config_builder()

config.disable_default_key_bindings = true
config.default_gui_startup_args = { "start", "--", const.INIT_SCRIPT }
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.keys = keys.keys
config.launch_menu = const.LAUNCH_MENU
config.set_environment_variables = { PATH = const.PATH }

ui.apply_to_config(config, wezterm)

wezterm.on("update-status", keys.update_keybindings)
wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
