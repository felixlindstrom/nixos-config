{ pkgs ? (import ../nixpkgs.nix) { } }: {
  sane-break = pkgs.callPackage ./sane-break.nix { };
}
