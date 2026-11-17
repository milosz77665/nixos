{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/master";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://nix-on-droid.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoQqvHJ9XCp+nidK7qkMQrU="
    ];
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-on-droid,
    }@inputs:
    let
      lib = nixpkgs.lib;
      localLib = import ./lib { inherit inputs lib; };
      production = import ./hosts/production.nix { inherit localLib; };
      test = import ./hosts/test { inherit localLib; };
    in
    {
      nixosConfigurations = production.nixosConfigurations // test.nixosConfigurations;
      homeConfigurations = production.homeConfigurations // test.homeConfigurations;
      nixOnDroidConfigurations = production.nixOnDroidConfigurations // test.nixOnDroidConfigurations;

      checks = localLib.checks.mkFlakeChecks {
        inherit
          self
          inputs
          lib
          localLib
          ;
      };

      formatter = localLib.flake.mkFormatter { inherit lib nixpkgs; };
    };
}
