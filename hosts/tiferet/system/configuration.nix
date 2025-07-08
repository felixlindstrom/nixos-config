{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
    ./hardware-configuration.nix
    ./modules
  ];

  boot.initrd.luks.devices."luks-49815e5d-2464-4cb9-a0a0-e6955d9bf39f".device =
    "/dev/disk/by-uuid/49815e5d-2464-4cb9-a0a0-e6955d9bf39f";

  networking.hostName = "tiferet";

  system.stateVersion = "24.11";
}
