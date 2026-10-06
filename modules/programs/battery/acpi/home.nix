{
  lib,
  pkgs,
  config,
  osConfig ? { },
  ...
}:
let
  cfg = osConfig.usr.battery.acpi or config.usr.battery.acpi;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      acpi
    ];
  };
}
