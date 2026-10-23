{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.battery.acpi;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf pkgs.stdenv.isLinux (
      with pkgs;
      [
        acpi
      ]
    );
  };
}
