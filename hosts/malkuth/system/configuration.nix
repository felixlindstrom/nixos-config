{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "malkuth";

  system.stateVersion = "24.05";
}
