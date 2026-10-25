{
  lib,
  config,
  ...
}:
let
  cfg = config.programs.dev.direnv;
in
{
  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
