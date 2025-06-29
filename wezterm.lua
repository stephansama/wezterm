---@type Wezterm
local wezterm = require("wezterm")
local keys = require("keys")
local const = require("const")
local get_colorscheme = require("utils").get_colorscheme

local config = wezterm.config_builder()

config.disable_default_key_bindings = true
config.default_gui_startup_args = { "start", "--", const.INIT_SCRIPT }
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.keys = keys.keys
config.launch_menu = const.LAUNCH_MENU
config.set_environment_variables = { PATH = const.PATH }

config.max_fps = 120

config.enable_wayland = false

--- command_palette
config.command_palette_rows = 5
config.command_palette_font_size = 30

--- font
config.font_size = const.FONT_SIZE
config.font = wezterm.font(const.FONT_NAME)

--- tab
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

--- window
config.native_macos_fullscreen_mode = true
config.window_background_opacity = const.BACKGROUND_OPACITY
config.window_decorations = "RESIZE"
config.window_padding = { top = 0, left = 0, right = 0, bottom = 0 }

--- color_scheme
config.color_scheme = get_colorscheme(wezterm.gui.get_appearance())

wezterm.on("update-status", keys.update_keybindings)
wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
