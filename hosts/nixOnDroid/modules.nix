{ ... }:
{
  home-manager.config = {
    programs = {
      cli-tools.atuin.enable = true;
      cli-tools.yazi.enable = true;
      cli-tools.lazygit.enable = true;
      cli-tools.zellij.enable = true;
      cli-tools.starship.enable = true;
    };

    usr = {
      nix-on-droid.theme.enable = true;
      dev.neovim.enable = true;
      dev.direnv.enable = true;
      dev-languages.go.enable = true;
      dev-languages.nodejs.enable = true;
      shells.bash.enable = true;
    };
  };
}
