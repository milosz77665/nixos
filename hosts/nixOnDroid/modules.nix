{ ... }:
{
  imports = [
    ../../system/nix-on-droid/theme.nix
  ];

  usr.nix-on-droid.theme.enable = true;

  home-manager.config = {
    usr.cli-tools.yazi.enable = true;
    usr.cli-tools.atuin.enable = true;
    usr.cli-tools.lazygit.enable = true;
    usr.cli-tools.zellij.enable = true;
    usr.cli-tools.starship.enable = true;
    usr.dev.neovim.enable = true;
    usr.dev.direnv.enable = true;
    usr.dev-languages.go.enable = true;
    usr.dev-languages.nodejs.enable = true;
    usr.shells.bash.enable = true;
  };
}
