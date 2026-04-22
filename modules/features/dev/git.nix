{ pkgs, ... }:
{
  home-manager.users.felix = {
    programs.git = {
      enable = true;
      settings.url."ssh://git@github.com".insteadOf = "https://github.com";
    };
    programs.lazygit.enable = true;
    home.packages = [ pkgs.gh ];
  };
}
