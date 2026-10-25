{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs.office.libreoffice;
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      libreoffice

      hunspell
      hunspellDicts.pl_PL
      hunspellDicts.en_US-large
    ];
  };
}
