{
  description = "NixOS and nix-darwin configuration flake";

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

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
  };

  outputs = {
    nixpkgs,
    home-manager,
    disko,
    nix-darwin,
    determinate,
    ...
  } @ inputs: {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    };

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
            home-manager.users.kamil = import ./hosts/thinkpad/home.nix;
          }
        ];
      };
    };

    darwinConfigurations."mac-mini" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/mac-mini/configuration.nix

        # Determinate zarządza Nixem, daemonem i GC. Moduł wyłącza
        # wbudowaną konfigurację `nix.*` z nix-darwin.
        determinate.darwinModules.default

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.kamil = import ./hosts/mac-mini/home.nix;
        }
      ];
    };
  };
}
