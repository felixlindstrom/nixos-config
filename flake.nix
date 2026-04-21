{
  description = "Felix nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland
    hyprpaper.url = "github:hyprwm/hyprpaper";

    hardware.url = "github:nixos/nixos-hardware";

    # SentinelOne
    # sentinelone.url = "github:felixlindstrom/sentinelone-nix/6ac4d80f772d7f323183819f60ccdf711ff26de9";
    # sentinelone.url = "git+file:///home/felix/Projects/sentinelone-nix?a=7";

    # Fenix
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
      ];
      system = "x86_64-linux";
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      overlays = import ./nix/overlays { inherit inputs; };
      nixosConfigurations = {
        malkuth = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/malkuth/system/configuration.nix
          ];
        };
        yesod = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/yesod/system/configuration.nix
          ];
        };
        hod = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/hod/system/configuration.nix
          ];
        };
        netsah = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/netsah/system/configuration.nix
          ];
        };
        tiferet = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/tiferet/system/configuration.nix
          ];
        };
      };

      homeConfigurations =
        let
          hmConfig = home-manager.lib.homeManagerConfiguration;
          pkgs-unstable = import inputs.nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          extraSpecialArgs = { inherit inputs outputs pkgs-unstable; };
        in
        {
          "felix@malkuth" = hmConfig {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = extraSpecialArgs;
            modules = [
              ./hosts/malkuth/home
            ];
          };
          "felix@yesod" = hmConfig {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = extraSpecialArgs;
            modules = [
              ./hosts/yesod/home
            ];
          };
          "felix@hod" = hmConfig {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = extraSpecialArgs;
            modules = [
              ./hosts/hod/home
            ];
          };
          "felix@netsah" = hmConfig {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = extraSpecialArgs;
            modules = [
              ./hosts/netsah/home
            ];
          };
          "felix@tiferet" = hmConfig {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = extraSpecialArgs;
            modules = [
              ./hosts/tiferet/home
            ];
          };
        };
    };
}
