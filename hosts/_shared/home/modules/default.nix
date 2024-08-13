{
  imports = [
    ./config.nix
    ./environment.nix
    ./packages
    ./programs
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
