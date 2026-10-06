{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.dev.direnv or config.usr.dev.direnv;
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
