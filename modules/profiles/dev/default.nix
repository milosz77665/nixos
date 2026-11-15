{
  lib,
  config,
  ...
}:
let
  cfg = config.profiles.dev;
in
{
  options.profiles.dev = {
    enable = lib.mkEnableOption "the development profile with everyday CLI and editor tools";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      cli-tools.atuin.enable = true;
      cli-tools.lazygit.enable = true;
      cli-tools.yazi.enable = true;
      dev.git.enable = true;
      dev.neovim.enable = true;
      shells.bash.enable = true;
    };
  };
}
