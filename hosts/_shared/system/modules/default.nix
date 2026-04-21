{
  inputs,
  outputs,
  ...
}:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      inputs.fenix.overlays.default
    ];
  };

  imports = [
    ./sentinelone.nix
    ./1password.nix
    ./battery.nix
    ./bluetooth.nix
    ./boot.nix
    ./docker.nix
    ./environment.nix
    ./file-manager.nix
    ./gpg.nix
    ./gpu.nix
    ./greeter.nix
    ./i18n.nix
    ./networking.nix
    ./nixsettings.nix
    ./npm.nix
    ./packages.nix
    ./printer.nix
    ./security.nix
    ./services.nix
    ./users.nix
    ./wm/niri.nix
  ];
}
