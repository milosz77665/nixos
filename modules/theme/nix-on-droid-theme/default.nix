{
  lib,
  ...
}:
{
  options.usr.nix-on-droid.theme = {
    enable = lib.mkEnableOption "Theme for nix-on-droid";
  };
}
