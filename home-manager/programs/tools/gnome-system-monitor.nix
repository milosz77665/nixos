{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-system-monitor
  ];
}
