{ config, pkgs, lib, ... }:
{
  boot.initrd.luks.devices."luks-ae41175e-e3df-41eb-b2cf-5b74fee9e22c".device = "/dev/disk/by-uuid/ae41175e-e3df-41eb-b2cf-5b74fee9e22c";
}
