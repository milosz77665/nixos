{
  lib,
  ...
}:
{
  options.usr.media.imv = {
    enable = lib.mkEnableOption "imv image viewer";
  };
}

