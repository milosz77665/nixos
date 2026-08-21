{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.secrets.seahorse;
in
{
  options.usr.secrets.seahorse = {
    enable = lib.mkEnableOption "Seahorse";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      seahorse
    ];
  };
}
