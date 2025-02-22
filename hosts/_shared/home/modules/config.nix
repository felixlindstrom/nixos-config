{ ... }:
let
  configDir = ../../../../config;
  binDir = ../../../../bin;
  assetsDir = ../../../../assets;
in
{
  xdg.configFile."hypr" = {
    source = "${configDir}/hypr";
    recursive = true;
  };
  home.file = {
    ".config/mako".source = "${configDir}/mako";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wezterm".source = "${configDir}/wezterm";
    ".config/zsh".source = "${configDir}/zsh";
    ".zshrc".source = "${configDir}/zsh/.zshrc";
    "bin".source = "${binDir}";
    "wallpapers".source = "${assetsDir}/wallpapers";
  };
}
