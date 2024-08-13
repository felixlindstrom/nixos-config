{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  environment.systemPackages = [
    pkgs.mbpfan
  ];

  services.mbpfan.enable = true;

  networking.hostName = "yesod";

  system.stateVersion = "24.05";
}
