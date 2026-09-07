{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.sys.display-managers.sddm;
in
{
  options.sys.display-managers.sddm = {
    enable = lib.mkEnableOption "SDDM";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      sddm-astronaut
    ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
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
