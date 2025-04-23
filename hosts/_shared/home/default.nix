{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ./modules
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
    ];
  };

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.11";
}
