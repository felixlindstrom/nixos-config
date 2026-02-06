{ pkgs, inputs, ... }:
{
  # import the home manager module
  imports = [
    inputs.dms.homeModules.default
  ];

  programs.dms-shell = {
    enable = true;
    package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
