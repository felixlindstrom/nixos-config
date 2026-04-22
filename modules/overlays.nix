{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: _prev: import ../nix/pkgs { pkgs = final; })
    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };
    })
    inputs.fenix.overlays.default
  ];
}
