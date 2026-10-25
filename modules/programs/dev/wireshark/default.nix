{
  lib,
  ...
}:
{
  options.programs.dev.wireshark = {
    enable = lib.mkEnableOption "Wireshark (network protocol analyzer)";
  };
}
