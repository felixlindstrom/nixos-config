{ ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/profiles/base.nix
  ];

  networking.hostName = "netsah";
  system.stateVersion = "25.11";

  boot.initrd.luks.devices."luks-cab9439d-84d3-49d5-a83f-9e8f3f6aebdc".device =
    "/dev/disk/by-uuid/cab9439d-84d3-49d5-a83f-9e8f3f6aebdc";
}
