{
  imports = [
    ./config.nix
    ./environment.nix
    ./packages
    ./programs
    ./security.nix
  ];

  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

}
