{
  lib,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.shells.bash or config.usr.shells.bash;
in
{
  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        export NIX_MANAGED="1"
      '';
    };
  };
}
