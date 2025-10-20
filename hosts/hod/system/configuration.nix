{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "hod";

  system.stateVersion = "25.05";
}
