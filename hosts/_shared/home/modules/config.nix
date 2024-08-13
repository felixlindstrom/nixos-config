{ config, ... }:
let
  configDir = ../../../../config;
  binDir = ../../../../bin;
  assetsDir = ../../../../assets;
in
{
  home.file = {
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wezterm".source = "${configDir}/wezterm";
    ".config/zsh".source = "${configDir}/zsh";
    ".zshrc".source = "${configDir}/zsh/.zshrc";
    "bin".source = "${binDir}";
    "wallpapers".source = "${assetsDir}/wallpapers";
  };
}
