{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    disko,
    ...
  } @ inputs: {
    formatter =
      nixpkgs.lib.genAttrs
      [
        "x86_64-linux"
        "aarch64-linux"
      ]
      (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          ./hosts/thinkpad/disko.nix
          ./hosts/thinkpad/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.kamil = import ./home.nix;
          }
        ];
      };
    };
  };
}
