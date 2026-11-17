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
      mkHostIfVars = localLib.flake.mkHostIfVars ./hosts;
    in
    {
      nixosConfigurations = {
        testWayland = localLib.builders.mkSystem {
          hostName = "testWayland";
          customVarsPath = ./hosts/test/vars.nix;
          customModulesPath = ./hosts/test/wayland/modules.nix;
          customConfigurationPath = ./hosts/test/wayland/configuration.nix;
        };
        testX11 = localLib.builders.mkSystem {
          hostName = "testX11";
          customVarsPath = ./hosts/test/vars.nix;
          customModulesPath = ./hosts/test/x11/modules.nix;
          customConfigurationPath = ./hosts/test/x11/configuration.nix;
        };
      }
      // mkHostIfVars "main" localLib.builders.mkSystem { }
      // mkHostIfVars "lowSpec" localLib.builders.mkSystem { };
      checks = localLib.checks.mkFlakeChecks {
        inherit
          self
          inputs
          lib
          localLib
          ;
      };

      nixOnDroidConfigurations = {
        testDroid = localLib.builders.mkNixOnDroid {
          hostName = "testDroid";
          customVarsPath = ./hosts/test/droid/vars.nix;
          customModulesPath = ./hosts/test/droid/modules.nix;
          customNixOnDroidPath = ./hosts/test/droid/nix-on-droid.nix;
        };
      }
      // mkHostIfVars "nixOnDroid" localLib.builders.mkNixOnDroid { };

      homeConfigurations = {
        testHome = localLib.builders.mkHome {
          hostName = "testHome";
          customVarsPath = ./hosts/test/home/vars.nix;
          customModulesPath = ./hosts/test/home/modules.nix;
        };
        testMac = localLib.builders.mkHome {
          hostName = "testMac";
          system = "aarch64-darwin";
          customVarsPath = ./hosts/test/mac/vars.nix;
          customModulesPath = ./hosts/test/mac/modules.nix;
        };
      }
      // mkHostIfVars "home" localLib.builders.mkHome { };

      formatter = localLib.flake.mkFormatter { inherit lib nixpkgs; };
    };
}
