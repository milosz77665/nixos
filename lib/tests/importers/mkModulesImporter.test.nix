{ lib, localLib }:
let
  basePrograms = ../fixtures/mkModulesImporter/programs;
  baseGrouped = ../fixtures/mkModulesImporter/grouped-programs;
in
{
  "test importers.mkModulesImporter: should discover and resolve direct module subdirectories for a specified target" =
    {
      expr = localLib.importers.mkModulesImporter {
        target = "home";
        basePath = basePrograms;
      } { inherit lib localLib; };

      expected = {
        imports = [
          (basePrograms + "/git/default.nix")
          (basePrograms + "/git/home.nix")

          (basePrograms + "/tmux/default.nix")

          (basePrograms + "/zsh/default.nix")
          (basePrograms + "/zsh/home.nix")
        ];
      };
    };

  "test importers.mkModulesImporter: should exclusively import target-matching files and ignore files belonging to other environments" =
    {
      expr = localLib.importers.mkModulesImporter {
        target = "droid";
        basePath = basePrograms;
      } { inherit lib localLib; };

      expected = {
        imports = [
          (basePrograms + "/git/default.nix")

          (basePrograms + "/tmux/default.nix")
          (basePrograms + "/tmux/droid.nix")

          (basePrograms + "/zsh/default.nix")
        ];
      };
    };

  "test importers.mkModulesImporter: should seamlessly resolve categorized module directories across nested paths" =
    {
      expr = localLib.importers.mkModulesImporter {
        target = "home";
        basePath = baseGrouped;
      } { inherit lib localLib; };

      expected = {
        imports = [
          (baseGrouped + "/cli/git/default.nix")
          (baseGrouped + "/cli/git/home.nix")

          (baseGrouped + "/cli/tmux/default.nix")

          (baseGrouped + "/gui/alacritty/default.nix")
          (baseGrouped + "/gui/alacritty/home.nix")
        ];
      };
    };
}
