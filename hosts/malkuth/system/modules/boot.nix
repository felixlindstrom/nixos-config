{ config, pkgs, lib, ... }:
{
  boot.initrd.luks.devices = {
    "luks-5ec5b641-8fc5-4623-9a75-46fd5b2dc8f7" = {
      device = "/dev/disk/by-uuid/5ec5b641-8fc5-4623-9a75-46fd5b2dc8f7";
    };
  };
}