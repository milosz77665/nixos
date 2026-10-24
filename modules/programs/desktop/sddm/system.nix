{
  lib,
  pkgs,
  config,
  isWayland,
  ...
}:
let
  cfg = config.desktop.sddm;
in
{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      sddm-astronaut
    ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = isWayland;
      theme = "sddm-astronaut-theme";
      package = pkgs.kdePackages.sddm;
      settings = {
        Theme = {
          Current = "sddm-astronaut-theme";
        };
      };
      extraPackages = with pkgs.kdePackages; [
        qtmultimedia
        qtsvg
        qtvirtualkeyboard
        qt5compat
      ];
    };
  };
}
