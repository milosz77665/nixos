{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.battery.acpi;
in
{
  options.usr.battery.acpi = {
    enable = lib.mkEnableOption "Advanced Configuration and Power Interface (ACPI)";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      acpi
    ];
  };
}
