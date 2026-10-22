{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.hardware.audio;
in
{
  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [ alsa-utils ];
  };
}
