{ pkgs, ... }:
{
  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
  };

  environment.systemPackages = [
    pkgs.betterlockscreen
  ];
}
