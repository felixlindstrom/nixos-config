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
    ./1password.nix
    ./bluetooth.nix
    ./boot.nix
    ./docker.nix
    ./environment.nix
    ./file-manager.nix
    ./gpg.nix
    ./greeter.nix
    ./i18n.nix
    ./networking.nix
    ./nixsettings.nix
    ./npm.nix
    ./packages.nix
    ./security.nix
    ./sentinelone.nix
    ./services.nix
    ./users.nix
    ./wm/niri.nix
  ];
}
