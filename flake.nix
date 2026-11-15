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
      mkHostIfVars =
        outputName: builder: extraArgs:
        let
          hostName = extraArgs.hostName or outputName;
          varsPath = extraArgs.customVarsPath or (./hosts/${hostName}/vars.nix);
        in
        lib.optionalAttrs (builtins.pathExists varsPath) {
          ${outputName} = builder ({ inherit hostName; } // extraArgs);
        };
      nixosHomePackages =
        hostName:
        let
          users = self.nixosConfigurations.${hostName}.config.home-manager.users;
        in
        self.nixosConfigurations.${hostName}.config.home-manager.users.${builtins.head (builtins.attrNames users)}.home.packages;
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
      checks.x86_64-linux =
        localLib.checks.mkIsolationChecks {
          basePath = ./modules;
          roots = [
            "programs"
            "hardware"
            "theme"
            "desktop"
          ];
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        } { inherit lib localLib; }
        // localLib.checks.mkStructureChecks {
          basePath = ./modules;
          roots = [
            "programs"
            "hardware"
            "theme"
            "desktop"
          ];
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        } { inherit lib localLib; }
        // localLib.checks.mkModuleEvalChecks {
          basePath = ./modules;
          roots = [
            "programs"
            "hardware"
            "theme"
            "desktop"
          ];
          inherit nixpkgs nixpkgs-unstable;
          varsPath = ./hosts/test/vars.nix;
          droidVarsPath = ./hosts/test/droid/vars.nix;
          checkPkgs = nixpkgs.legacyPackages.x86_64-linux;
        } { inherit lib localLib; }
        // localLib.checks.mkDuplicatePackageChecks {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          hosts = {
            testWayland = {
              home = nixosHomePackages "testWayland";
              system = self.nixosConfigurations.testWayland.config.environment.systemPackages;
            };
            testX11 = {
              home = nixosHomePackages "testX11";
              system = self.nixosConfigurations.testX11.config.environment.systemPackages;
            };
            testHome = {
              home = self.homeConfigurations.testHome.config.home.packages;
            };
            testMac = {
              home = self.homeConfigurations.testMac.config.home.packages;
            };
            testDroid = {
              home = self.nixOnDroidConfigurations.testDroid.config.home-manager.config.home.packages;
            };
          };
        } { inherit lib localLib; }
        // {
          host-testWayland = self.nixosConfigurations.testWayland.config.system.build.toplevel;
          host-testX11 = self.nixosConfigurations.testX11.config.system.build.toplevel;
          host-testHome = self.homeConfigurations.testHome.activationPackage;
          eval-testDroid = nixpkgs.legacyPackages.x86_64-linux.writeText "eval-testDroid" (
            builtins.toJSON {
              theme = builtins.attrNames self.nixOnDroidConfigurations.testDroid.config.home-manager.config.theme;
              homeDirectory =
                self.nixOnDroidConfigurations.testDroid.config.home-manager.config.home.homeDirectory;
            }
          );
        };

      checks.aarch64-darwin = {
        host-testMac = self.homeConfigurations.testMac.activationPackage;
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
          customVarsPath = ./hosts/test/vars.nix;
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

      formatter = lib.genAttrs [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ] (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        pkgs.writeShellApplication {
          name = "nixfmt-rfc-style";
          runtimeInputs = [
            pkgs.git
            pkgs.nixfmt-rfc-style
          ];
          text = ''
            files=()
            options=()

            for arg in "$@"; do
              case "$arg" in
                -*) options+=("$arg") ;;
                *) files+=("$arg") ;;
              esac
            done

            if [ "''${#files[@]}" -eq 0 ]; then
              # Empty fixture .nix files are intentional and nixfmt cannot parse them.
              while IFS= read -r -d "" file; do
                if [ -s "$file" ]; then
                  files+=("$file")
                fi
              done < <(git ls-files -z -- "*.nix")
            fi

            exec nixfmt "''${options[@]}" "''${files[@]}"
          '';
        }
      );
    };
}
