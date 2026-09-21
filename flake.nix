{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/master";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
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
      localLib = import ./lib { inherit inputs; };
    in
    {
      nixosConfigurations = {
        main = localLib.builders.mkSystem {
          hostName = "main";
        };
        lowSpec = localLib.builders.mkSystem {
          hostName = "lowSpec";
        };

        testWayland = localLib.builders.mkSystem {
          hostName = "testWayland";
          customModulesPath = ./hosts/test/wayland/modules.nix;
          customConfigurationPath = ./hosts/test/wayland/configuration.nix;
        };
        testX11 = localLib.builders.mkSystem {
          hostName = "testX11";
          customModulesPath = ./hosts/test/x11/modules.nix;
          customConfigurationPath = ./hosts/test/x11/configuration.nix;
        };
      };

      nixOnDroidConfigurations = {
        nixOnDroid = localLib.builders.mkNixOnDroid {
          hostName = "nixOnDroid";
          system = "aarch64-linux";
        };
      };
    };
}
