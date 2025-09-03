{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  users.users.felix = {
    isNormalUser = true;
    description = "felix";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ];
    shell = pkgs.zsh;
  };
}
