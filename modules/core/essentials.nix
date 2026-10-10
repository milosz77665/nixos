{ pkgs, ...  }:
{
  home.packages = with pkgs; [
    git
    tree
    wget
    curl
    vim
    openssh

    ripgrep
    fd
    bat
    btop
    tldr

    gnumake
    gcc
    pkg-config

    p7zip
    zip
    gzip
    unzip
    gnutar

    htop
    jq
    nixfmt-rfc-style

    ffmpeg
    mpv
    imv
  ];
}
