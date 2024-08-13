local wezterm = require "wezterm"
local mappings = require "modules.mappings"

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

return {
  color_scheme = 'Dark+',
  -- color_scheme = "nord",
  font = wezterm.font_with_fallback { "JetBrains Mono" },
  font_size = 12,

  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  inactive_pane_hsb = {
    brightness = 0.7,
  },
  -- key bindings
  leader = mappings.leader,
  keys = mappings.keys,
  key_tables = mappings.key_tables,
  window_padding = {
    top = 10,
  },

  enable_wayland = false,
}
