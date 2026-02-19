{ pkgs, inputs, ... }:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in
{
  home.packages = [
    pkgs-unstable.claude-code
    pkgs-unstable.gemini-cli
  ];
}
