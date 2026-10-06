{
  pkgs,
  vars,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = vars.user.name;
    homeDirectory = vars.homeDirectory;
    stateVersion = "25.11";
  };

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
