{
  config,
  lib,
  ...
}:
let
  cfg = config.usr.shells.bash;
in
{
  options.usr.shells.bash = {
    enable = lib.mkEnableOption "Bash";
  };

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
