{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.dev.direnv;
in
{
  options.usr.dev.direnv = {
    enable = lib.mkEnableOption "Direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
