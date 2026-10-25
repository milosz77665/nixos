{
  lib,
  ...
}:
{
  options.programs.file-managers.nemo = {
    enable = lib.mkEnableOption "Nemo (advanced file manager from Cinnamon)";
  };
}
