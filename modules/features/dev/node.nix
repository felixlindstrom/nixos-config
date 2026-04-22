{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = [ pkgs.nodejs ];
  };
}
