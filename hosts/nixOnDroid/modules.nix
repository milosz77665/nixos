{ ... }:
{
  home-manager.config = {
    programs = {
      cli-tools.atuin.enable = true;
      cli-tools.yazi.enable = true;
      cli-tools.lazygit.enable = true;
      cli-tools.zellij.enable = true;
      cli-tools.starship.enable = true;
      dev.neovim.enable = true;
      dev.direnv.enable = true;
      dev.go.enable = true;
      dev.nodejs.enable = true;
      shells.bash.enable = true;
    };

    theme = {
      nix-on-droid-theme.enable = true;
    };
  };
}
