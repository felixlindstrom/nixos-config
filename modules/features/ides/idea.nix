{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = [ pkgs.jetbrains.idea-oss ];
  };
}
