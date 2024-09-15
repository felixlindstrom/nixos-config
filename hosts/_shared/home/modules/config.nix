{ config, ... }:
let
  configDir = ../../../../config;
  binDir = ../../../../bin;
  assetsDir = ../../../../assets;

  mkooss = config.lib.file.mkOutOfStoreSymlink;
  linkConfig = filePath: mkooss "${config.home.homeDirectory}/Projects/nixos-config/config/${filePath}"; # Change this to be relative..
in
{
  #xdg.configFile."waybar".source = linkConfig "waybar";
  home.file = {
    ".config/hypr".source = "${configDir}/hypr";
    ".config/sway".source = "${configDir}/sway";
    ".config/rofi".source = "${configDir}/rofi";
    #".config/waybar".source = "${configDir}/waybar";
    ".config/wezterm".source = "${configDir}/wezterm";
    ".config/zsh".source = "${configDir}/zsh";
    ".zshrc".source = "${configDir}/zsh/.zshrc";
    "bin".source = "${binDir}";
    "wallpapers".source = "${assetsDir}/wallpapers";
  };
}
