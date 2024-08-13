{ config, pkgs, lib, ... }:
{
  boot.initrd.luks.devices = {
    "luks-14d2e1d2-ac68-41fa-950e-933a2e3d9c6c" = {
      device = "/dev/disk/by-uuid/14d2e1d2-ac68-41fa-950e-933a2e3d9c6c";
    };
  };
}
