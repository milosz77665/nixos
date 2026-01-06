{ pkgs, ... }:
{
  security.pam.services.betterlockscreen = { };

  environment.systemPackages = with pkgs; [
    betterlockscreen
  ];
}
