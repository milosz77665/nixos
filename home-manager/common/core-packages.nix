{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tree
    wget

    p7zip
    zip
    unzip

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
}
