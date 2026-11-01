{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };
  };

  system.stateVersion = "25.11";
}
