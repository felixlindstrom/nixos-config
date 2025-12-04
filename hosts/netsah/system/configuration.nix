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

  networking.hostName = "netsah";

  system.stateVersion = "25.11";
}
