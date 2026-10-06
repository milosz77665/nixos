{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.sys.tools.wireshark;
in
{
  config = lib.mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };
}
