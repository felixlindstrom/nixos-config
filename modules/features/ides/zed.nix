{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = [ pkgs.zed-editor ];
  };
}
