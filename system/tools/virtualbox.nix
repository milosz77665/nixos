{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.tools.virtualbox;
in
{
  options.sys.tools.virtualbox = {
    enable = lib.mkEnableOption "Virtualbox";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.virtualbox.host.enable = true;
  };
}
