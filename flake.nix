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
    }:
    let
      userConfig = import ./vars;

      mkSystem =
        {
          hostName,
          system ? "x86_64-linux",
          userConfig,
        }:

        let
          pkgsUnstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        in

        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit userConfig;
            inherit hostName;
            inherit pkgsUnstable;
          };

          modules = [
            ./hosts/${hostName}/configuration.nix
            ./hosts/${hostName}/modules.nix
            ./system
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = {
                inherit userConfig;
                inherit hostName;
                inherit pkgsUnstable;
              };
              home-manager.users.${userConfig.user.name} =
                { pkgs, ... }:
                {
                  imports = [
                    ./home-manager
                    ./home-manager/programs
                  ];
                };
            }
          ];
        };

      mkNixOnDroid =
        {
          hostName,
          system ? "aarch64-linux",
          userConfig,
        }:

        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          pkgsUnstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        in

        nix-on-droid.lib.nixOnDroidConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit userConfig;
            inherit hostName;
            inherit pkgsUnstable;
          };

          modules = [
            ./hosts/${hostName}/nix-on-droid.nix
            ./hosts/${hostName}/modules.nix
            {
              home-manager.config = {
                _module.args = {
                  inherit userConfig;
                  inherit hostName;
                  inherit pkgsUnstable;
                };

                imports = [
                  ./home-manager
                  ./home-manager/programs
                ];
              };
            }
          ];
        };

      mkHome =
        {
          hostName,
          system ? "x86_64-linux",
          userConfig,
        }:

        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          pkgsUnstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        in

        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit userConfig;
            inherit hostName;
            inherit pkgsUnstable;
          };

          modules = [
            { targets.genericLinux.enable = true; }
            ./home-manager
            ./hosts/${hostName}/modules.nix
            ./home-manager/programs
          ];
        };
    in
    {
      nixosConfigurations = {
        main = mkSystem {
          hostName = "main";
          inherit userConfig;
        };
        lowSpec = mkSystem {
          hostName = "lowSpec";
          inherit userConfig;
        };
        testWayland = mkSystem {
          hostName = "testWayland";
          userConfig = import ./vars/default.example.nix;
        };
        testX11 = mkSystem {
          hostName = "testX11";
          userConfig = import ./vars/default.example.nix;
        };
      };

      nixOnDroidConfigurations = {
        nixOnDroid = mkNixOnDroid {
          hostName = "nixOnDroid";
          system = "aarch64-linux";
          inherit userConfig;
        };
      };
    };
}
