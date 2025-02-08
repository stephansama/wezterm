local M = {}

local const = require("const")
local get_colorscheme = require("utils").get_colorscheme

---@param config Config
---@param wezterm Wezterm
M.apply_to_config = function(config, wezterm)
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
end

return M
