{
  description = "Felix nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    hyprpaper.url = "github:hyprwm/hyprpaper";

    sentione.url = "git+file:///home/felix/Projects/sentione?a=1";
    sentinelone-deb = {
      url = "file+file:///home/felix/Projects/nixos-config/SentinelAgent_linux_x86_64_v25_1_2_17.deb";
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    mkHost = hostModule: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ hostModule ];
    };
  in
  {
    nixosConfigurations = {
      netsah  = mkHost ./hosts/netsah;
      tiferet = mkHost ./hosts/tiferet;
    };
  };
}
