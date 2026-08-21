{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.tools.wireshark;
in
{
  options.sys.tools.wireshark = {
    enable = lib.mkEnableOption "Wireshark";
  };

  config = lib.mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };
}
