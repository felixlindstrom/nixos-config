{ pkgs, ... }:
{
  home-manager.users.felix = { config, ... }:
  let
    mkooss = config.lib.file.mkOutOfStoreSymlink;
    linkConfig = filePath: mkooss "${config.home.homeDirectory}/Projects/nixos-config/config/${filePath}";
  in
  {
    xdg.configFile."zed".source = linkConfig "zed";
    home.packages = [ pkgs.zed-editor ];
  };
}
