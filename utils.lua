local const = require("const")

local M = {}

--- catppuccin theme
---@see catppuccin_documentation https://github.com/catppuccin/wezterm
M.get_colorscheme = function(appearance)
  if appearance:find("Dark") then
    return const.THEME_DARK
  else
    return const.THEME_LIGHT
  end
end

--- determine whether or not current wezterm pane is in tmux or not
---@param pane table current wezterm pane
---@return boolean
M.is_tmux = function(pane)
  return pane:get_user_vars().WEZTERM_IN_TMUX == "1"
end

return M
