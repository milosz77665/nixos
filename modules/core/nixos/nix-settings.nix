{ lib, ... }:
{
  nix.settings.experimental-features = lib.mkDefault [
    "nix-command"
    "flakes"
  ];

  # Project-wide policy: hosts that replace nixpkgs.config must use mkForce.
  nixpkgs.config.allowUnfree = true;

  nix.gc = lib.mkDefault {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
