{
  description = "Felix nix config";

  inputs = {
    # Nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    # home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland
    hyprpaper.url = "github:hyprwm/hyprpaper";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];
    in
    {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./nix/pkgs { inherit pkgs; }
      );

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
      };

      homeConfigurations =
        let
          hmConfig = home-manager.lib.homeManagerConfiguration;
          extraSpecialArgs = { inherit inputs outputs; };
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
        };
    };
}

