{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgsUnstable; [
    nodejs_22           
  ];
}