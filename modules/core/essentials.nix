{ pkgs, ...  }:
{
  home.packages = with pkgs; [
    tree
    wget
    curl
    vim
    openssh

    ripgrep
    fd
    bat
    tldr
    zoxide
    eza
    
    btop
    duf
    dust

    gnumake
    gcc
    pkg-config

    p7zip
    zip
    gzip
    unzip
    gnutar

    jq
    nixfmt-rfc-style
  ];
}
