{
  lib,
  config,

  ...
}:
let
  cfg = config.programs.shells.bash;
in
{
  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
