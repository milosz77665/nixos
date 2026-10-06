{
  lib,
  ...
}:
{
  options.sys.tools.wireshark = {
    enable = lib.mkEnableOption "Wireshark";
  };
}
