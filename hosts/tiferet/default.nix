{ inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
    ./hardware.nix
    ../../modules/profiles/base.nix
    ../../modules/features/services/easyeffects.nix
  ];

  networking.hostName = "tiferet";
  system.stateVersion = "25.11";

  boot.initrd.luks.devices."luks-49815e5d-2464-4cb9-a0a0-e6955d9bf39f".device =
    "/dev/disk/by-uuid/49815e5d-2464-4cb9-a0a0-e6955d9bf39f";

  nix.extraOptions = ''
    extra-substituters = https://devenv.cachix.org
    extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
  '';
}
