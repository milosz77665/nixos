{
  core.display-server = "none";
  programs = {
    cli-tools.atuin.enable = true;
    cli-tools.lazydocker.enable = true;
    cli-tools.lazygit.enable = true;
    cli-tools.starship.enable = true;
    cli-tools.yazi.enable = true;
    cli-tools.zellij.enable = true;
    dev.direnv.enable = true;
    dev.git.enable = true;
    dev.neovim.enable = true;
    dev.go.enable = true;
    dev.nodejs.enable = true;
    media.ffmpeg.enable = true;
    shells.bash.enable = true;
  };

  usr = {
    desktop.fonts.enable = true;
    terminals.alacritty.enable = true;
  };
}
