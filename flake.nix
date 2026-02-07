{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      userConfig = import ./vars;
      mainModules = import ./hosts/main/modules.nix;
      lowSpecModules = import ./hosts/lowSpec/modules.nix;

      mkSystem =
        {
          hostName,
          system ? "x86_64-linux",
          userConfig,
          extraSystemModules ? [ ],
          extraHomeModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit userConfig;
            inherit hostName;
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
    };
}
