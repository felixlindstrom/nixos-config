{ pkgs, ... }:
{
  home-manager.users.felix = {
    home.packages = with pkgs; [
      wl-clipboard
      wl-clip-persist
      cliphist
    ];
  };
}
