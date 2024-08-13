{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "hod";

  system.stateVersion = "24.11";
}
