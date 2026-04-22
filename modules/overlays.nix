{ inputs, ... }:
{
  nixpkgs.overlays = [
    (final: _prev: import ../nix/pkgs { pkgs = final; })
    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.system;
        config.allowUnfree = true;
      };
    })
    inputs.fenix.overlays.default
  ];
}
