{ config, pkgs, lib, ... }:
{
  boot.initrd.luks.devices = {
    "luks-cab9439d-84d3-49d5-a83f-9e8f3f6aebdc" = {
      device = "/dev/disk/by-uuid/cab9439d-84d3-49d5-a83f-9e8f3f6aebdc";
    };
  };
}
