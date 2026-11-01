{ lib, ... }:
{
  # Set your time zone.
  time.timeZone = lib.mkDefault "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = lib.mkDefault "pl_PL.UTF-8";
    LC_IDENTIFICATION = lib.mkDefault "pl_PL.UTF-8";
    LC_MEASUREMENT = lib.mkDefault "pl_PL.UTF-8";
    LC_MONETARY = lib.mkDefault "pl_PL.UTF-8";
    LC_NAME = lib.mkDefault "pl_PL.UTF-8";
    LC_NUMERIC = lib.mkDefault "pl_PL.UTF-8";
    LC_PAPER = lib.mkDefault "pl_PL.UTF-8";
    LC_TELEPHONE = lib.mkDefault "pl_PL.UTF-8";
    LC_TIME = lib.mkDefault "pl_PL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = lib.mkDefault "pl";
    variant = lib.mkDefault "";
  };

  # Configure console keymap
  console.keyMap = lib.mkDefault "pl2";
}
