local M = {}

---@type Action
local action = require("wezterm").action
local const = require("const")

-- local launch_command_pallette = action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" })
local launch_char_select = action.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" })

M.keys = {
  -- { key = "l", mods = "ALT", action = launch_command_pallette },
  -- { key = "s", mods = "CTRL", action = launch_char_select },
}

M.tmux_keys = {
  { key = "s", mods = "LEADER", action = launch_char_select },
  { key = "c", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
  table.unpack(M.keys),
}

M.update_keybindings = function(window, pane)
  window:set_config_override({ keys = M.tmux_keys, leader = const.LEADER_KEY })
  if M.is_tmux(pane) then
    window:set_config_override({ keys = M.keys })
  else
    window:set_config_override({ keys = M.tmux_keys, leader = const.LEADER_KEY })
  end
end

return M
