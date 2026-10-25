{
  lib,
  ...
}:
{
  options.programs.dev.virtualbox = {
    enable = lib.mkEnableOption "VirtualBox (hypervisor and host utilities)";
  };
}
