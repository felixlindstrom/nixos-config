{ ... }:
{
  imports = [
    ../../_shared/home
  ];

  home.file = {
    ".config/hypr/confs/general.conf".source = "${../config}/hypr/confs/general.conf";
    ".config/hypr/confs/input.conf".source = "${../config}/hypr/confs/input.conf";
    ".config/hypr/confs/monitors.conf".source = "${../config}/hypr/confs/monitors.conf";
    ".config/hypr/hyprland.conf".source = "${../config}/hypr/hyprland.conf";
    ".config/wezterm.lua".source = "${../config}/wezterm/wezterm.lua";
  };
}
