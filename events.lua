local M = {}
local keys = require("keys")
local const = require("const")
local is_tmux = require("utils").is_tmux

local update_status = function(window, pane)
  window:set_config_override({ keys = keys.tmux_keys, leader = const.LEADER_KEY })
  if is_tmux(pane) then
    window:set_config_override({ keys = keys.keys })
  else
    window:set_config_override({ keys = keys.tmux_keys, leader = const.LEADER_KEY })
  end
end

--- register all events to wezterm instance
--- @param wezterm Wezterm
M.register = function(wezterm)
  wezterm.on("update-status", update_status)
  wezterm.on("gui-startup", function(cmd)
    --- maximize on creation
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
  end)
end

return M
