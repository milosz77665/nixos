{ pkgs, pkgsUnstable, ... }:
{
  home.packages = with pkgsUnstable; [
    go
  ];
}