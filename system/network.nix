{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.network;
in
{
  options.sys.network = {
    enable = lib.mkEnableOption "Network";
  };

  config = lib.mkIf cfg.enable {
    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;
  };
}
