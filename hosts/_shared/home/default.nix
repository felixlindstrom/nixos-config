{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./modules
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      inputs.fenix.overlays.default
    ];
  };

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
