{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.usr.core.packages;
in
{
  options.usr.core.packages = {
    enable = lib.mkEnableOption "Yazi";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      tree
      wget
      curl
      vim
      openssh

      ripgrep
      fd

      gnumake
      gcc
      pkg-config

      p7zip
      zip
      gzip
      unzip
      gnutar

      htop
      btop
      bat
      jq
      tldr

      ffmpeg
      mpv
      imv
      alsa-utils

      nixfmt-rfc-style
    ];
  };
}
