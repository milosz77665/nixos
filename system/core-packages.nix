{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ntfs3g
    net-tools
    brightnessctl

    git

    vim
    wget
  ];
}
