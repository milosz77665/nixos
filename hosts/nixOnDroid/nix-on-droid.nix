{ config, pkgs, ... }:
{
  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  android-integration.termux-setup-storage.enable = true;

  # Read the changelog before changing this value
  system.stateVersion = "24.05";
}
