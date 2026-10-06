{
  lib,
  ...
}:
{
  options.usr.dev.neovim = {
    enable = lib.mkEnableOption "Neovim";
  };
}
