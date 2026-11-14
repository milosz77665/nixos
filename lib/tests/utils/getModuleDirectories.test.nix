{ lib, localLib }:
let
  baseModules = ../fixtures/mkImporter/modules;
  baseGrouped = ../fixtures/mkModulesImporter/grouped-programs;
  baseEmpty = ../fixtures/getDirectories/empty-folder;
in
{
  "test utils.getModuleDirectories: should only return directories with default.nix" = {
    expr = localLib.utils.getModuleDirectories { basePath = baseModules; };

    expected = [
      {
        path = baseModules + "/audio";
        relative = [ "audio" ];
        name = "audio";
      }
      {
        path = baseModules + "/video";
        relative = [ "video" ];
        name = "video";
      }
    ];
  };

  "test utils.getModuleDirectories: should walk nested module directories when roots are omitted" =
    {
      expr = localLib.utils.getModuleDirectories { basePath = baseGrouped; };

      expected = [
        {
          path = baseGrouped + "/cli/git";
          relative = [
            "cli"
            "git"
          ];
          name = "cli-git";
        }
        {
          path = baseGrouped + "/cli/tmux";
          relative = [
            "cli"
            "tmux"
          ];
          name = "cli-tmux";
        }
        {
          path = baseGrouped + "/gui/alacritty";
          relative = [
            "gui"
            "alacritty"
          ];
          name = "gui-alacritty";
        }
      ];
    };

  "test utils.getModuleDirectories: should include root segments when roots are provided" = {
    expr = localLib.utils.getModuleDirectories {
      basePath = baseGrouped;
      roots = [
        "cli"
        "gui"
      ];
    };

    expected = [
      {
        path = baseGrouped + "/cli/git";
        relative = [
          "cli"
          "git"
        ];
        name = "cli-git";
      }
      {
        path = baseGrouped + "/cli/tmux";
        relative = [
          "cli"
          "tmux"
        ];
        name = "cli-tmux";
      }
      {
        path = baseGrouped + "/gui/alacritty";
        relative = [
          "gui"
          "alacritty"
        ];
        name = "gui-alacritty";
      }
    ];
  };

  "test utils.getModuleDirectories: should return an empty list when no modules exist" = {
    expr = localLib.utils.getModuleDirectories { basePath = baseEmpty; };

    expected = [ ];
  };
}
