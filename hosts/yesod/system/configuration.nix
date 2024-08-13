{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "yesod";

  system.stateVersion = "24.05";
}
