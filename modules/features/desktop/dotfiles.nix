{ ... }:
{
  home-manager.users.felix =
    { config, ... }:
    let
      mkooss = config.lib.file.mkOutOfStoreSymlink;
      linkConfig =
        filePath: mkooss "${config.home.homeDirectory}/Projects/nixos-config/config/${filePath}";
      configDir = ../../../config;
      binDir = ../../../bin;
      assetsDir = ../../../assets;
    in
    {
      xdg.configFile."starship.toml".source = linkConfig "starship.toml";
      xdg.configFile."niri/config.kdl".source = linkConfig "niri/config.kdl";
      xdg.configFile."fuzzel".source = linkConfig "fuzzel";
      xdg.configFile."zed".source = linkConfig "zed";
      xdg.configFile."hypr/hyprlock.conf".source = linkConfig "hypr/hyprlock.conf";
      home.file = {
        ".config/mako".source = "${configDir}/mako";
        ".config/rofi".source = "${configDir}/rofi";
        ".config/waybar".source = "${configDir}/waybar";
        ".config/foot".source = "${configDir}/foot";
        ".config/wezterm".source = "${configDir}/wezterm";
        "bin".source = "${binDir}";
        "wallpapers".source = "${assetsDir}/wallpapers";
      };
    };
}
