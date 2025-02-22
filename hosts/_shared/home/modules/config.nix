{ config, ... }:
let
  configDir = ../../../../config;
  binDir = ../../../../bin;
  assetsDir = ../../../../assets;

  mkooss = config.lib.file.mkOutOfStoreSymlink;
  linkConfig = filePath: mkooss "${config.users.users.felix.home}/Projects/nixos-config/config/${filePath}"; # Change this to be relative..
in
{
  xdg.configFile."hypr" = {
    source = "${configDir}/hypr";
    recursive = true;
  };
  #xdg.configFile."waybar".source = linkConfig "waybar";
  # xdg.configFile.rofi = {
  #   source = config.lib.file.mkOutOfStoreSymlink "${configDir}/rofi";
  #   recursive = true;
  # };
  home.file = {
    # ".config/hypr".source = "${configDir}/hypr";
    ".config/sway".source = "${configDir}/sway";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wezterm".source = "${configDir}/wezterm";
    ".config/zsh".source = "${configDir}/zsh";
    ".zshrc".source = "${configDir}/zsh/.zshrc";
    "bin".source = "${binDir}";
    "wallpapers".source = "${assetsDir}/wallpapers";
  };
}
