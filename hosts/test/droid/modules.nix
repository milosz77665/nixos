{
  core.display-server = "none";
  programs = {
    cli-tools.atuin.enable = true;
  };

  usr = {
    nix-on-droid.theme.enable = true;
    cli-tools.lazygit.enable = true;
    cli-tools.starship.enable = true;
    cli-tools.yazi.enable = true;
    cli-tools.zellij.enable = true;
    dev.direnv.enable = true;
    dev.git.enable = true;
    dev.neovim.enable = true;
    dev-languages.go.enable = true;
    dev-languages.nodejs.enable = true;
    media.ffmpeg.enable = true;
    shells.bash.enable = true;
  };
}

