{ pkgs, ... }:
{
  home-manager.users.felix = {
    programs.fuzzel.enable = true;
  };
}
