{
  lib,
  ...
}:
{
  options.usr.battery.acpi = {
    enable = lib.mkEnableOption "Advanced Configuration and Power Interface (ACPI)";
  };
}
