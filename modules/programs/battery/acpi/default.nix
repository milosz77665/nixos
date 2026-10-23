{
  lib,
  ...
}:
{
  options.programs.battery.acpi = {
    enable = lib.mkEnableOption "Advanced Configuration and Power Interface (ACPI)";
  };
}
