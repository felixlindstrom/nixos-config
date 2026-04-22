{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = with pkgs; [ mako libnotify ];
    services.mako = {
      enable = true;
      settings = {
        ignore-timeout = true;
        default-timeout = 10000;
      };
    };
  };
}
