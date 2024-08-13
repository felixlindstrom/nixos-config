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
    ];
  };

  home = {
    username = "felix";
    homeDirectory = "/home/felix";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.11";
}
