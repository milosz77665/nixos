{
  lib,
  config,
  ...
}:
let
  cfg = config.sys.tools.virtualbox;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox.host.enable = true;
  };
}
