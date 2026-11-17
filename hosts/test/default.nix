{ localLib }:
{
  nixosConfigurations = {
    testWayland = localLib.builders.mkSystem {
      hostName = "testWayland";
      customVarsPath = ./vars.nix;
      customModulesPath = ./wayland/modules.nix;
      customConfigurationPath = ./wayland/configuration.nix;
    };
    testX11 = localLib.builders.mkSystem {
      hostName = "testX11";
      customVarsPath = ./vars.nix;
      customModulesPath = ./x11/modules.nix;
      customConfigurationPath = ./x11/configuration.nix;
    };
  };

  homeConfigurations = {
    testHome = localLib.builders.mkHome {
      hostName = "testHome";
      customVarsPath = ./home/vars.nix;
      customModulesPath = ./home/modules.nix;
    };
    testMac = localLib.builders.mkHome {
      hostName = "testMac";
      system = "aarch64-darwin";
      customVarsPath = ./mac/vars.nix;
      customModulesPath = ./mac/modules.nix;
    };
  };

  nixOnDroidConfigurations = {
    testDroid = localLib.builders.mkNixOnDroid {
      hostName = "testDroid";
      customVarsPath = ./droid/vars.nix;
      customModulesPath = ./droid/modules.nix;
      customNixOnDroidPath = ./droid/nix-on-droid.nix;
    };
  };
}
