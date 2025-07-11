{ config, ... }:
let
  configDir = ../../../../config;
  binDir = ../../../../bin;
  assetsDir = ../../../../assets;

  mkooss = config.lib.file.mkOutOfStoreSymlink;
  linkConfig =
    filePath: mkooss "${config.home.homeDirectory}/Projects/nixos-config/config/${filePath}"; # Change this to be relative..
in
{
  xdg.configFile."starship.toml".source = linkConfig "starship.toml";
  xdg.configFile."niri/config.kdl".source = linkConfig "niri/config.kdl";
  xdg.configFile."hypr".source = linkConfig "hypr";
  home.file = {
    ".config/mako".source = "${configDir}/mako";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wezterm".source = "${configDir}/wezterm";
    ".config/zsh".source = "${configDir}/zsh";
    # ".config/hypr".source = "${configDir}/hypr";
    ".zshrc".source = "${configDir}/zsh/.zshrc";
    "bin".source = "${binDir}";
    "wallpapers".source = "${assetsDir}/wallpapers";
  };
}
