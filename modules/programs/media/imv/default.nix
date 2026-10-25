{
  lib,
  ...
}:
{
  options.programs.media.imv = {
    enable = lib.mkEnableOption "imv (image viewer)";
  };
}

