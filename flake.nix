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
      mainModules = import ./hosts/main/modules.nix;
      lowSpecModules = import ./hosts/lowSpec/modules.nix;
      nixOnDroidModules = import ./hosts/nixOnDroid/modules.nix;

      mkSystem =
        {
          hostName,
          system ? "x86_64-linux",
          userConfig,
          extraSystemModules ? [ ],
          extraHomeModules ? [ ],
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
                    ./home-manager/common
                  ]
                  ++ extraHomeModules;
                };
            }
          ]
          ++ extraSystemModules;
        };

      mkNixOnDroid =
        {
          hostName,
          system ? "aarch64-linux",
          userConfig,
          extraHomeModules ? [ ],
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
            {
              home-manager.config = {
                _module.args = {
                  inherit userConfig;
                  inherit hostName;
                  inherit pkgsUnstable;
                };
                
                imports = [
                  ./home-manager
                  ./home-manager/common
                ]
                ++ extraHomeModules;
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        main = mkSystem {
          hostName = "main";
          inherit userConfig;
          extraSystemModules = mainModules.system;
          extraHomeModules = mainModules.home;
        };
        lowSpec = mkSystem {
          hostName = "lowSpec";
          inherit userConfig;
          extraSystemModules = lowSpecModules.system;
          extraHomeModules = lowSpecModules.home;
        };
      };

      nixOnDroidConfigurations = {
        nixOnDroid = mkNixOnDroid {
          hostName = "nixOnDroid";
          system = "aarch64-linux";
          inherit userConfig;
          extraHomeModules = nixOnDroidModules.home;
       };
     };
   };
}
