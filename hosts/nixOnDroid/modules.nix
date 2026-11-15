{
  profiles.dev.enable = true;

  programs = {
    cli-tools.zellij.enable = true;
    cli-tools.starship.enable = true;
    dev.direnv.enable = true;
    dev.go.enable = true;
    dev.nodejs.enable = true;
  };

  theme = {
    nix-on-droid-theme.enable = true;
  };
}
