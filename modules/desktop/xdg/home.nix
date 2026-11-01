{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.desktop.xdg;
  applications = import ./applications.nix;

  roleEnabled =
    role: app: lib.attrByPath applications.${role}.applications.${app}.enable false config;

  roleMappings =
    role: app:
    lib.genAttrs applications.${role}.mimeTypes (
      _: applications.${role}.applications.${app}.desktop
    );

  roleDefault = role: app: lib.mkIf (roleEnabled role app) (roleMappings role app);
in
{
  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    xdg.mimeApps = {
      enable = true;

      defaultApplications = lib.mkMerge [
        (roleDefault "browser" cfg.browser)
        (roleDefault "imageViewer" cfg.imageViewer)
        (roleDefault "imageEditor" cfg.imageEditor)
        (roleDefault "codeEditor" cfg.codeEditor)
        (roleDefault "pdfViewer" cfg.pdfViewer)
        (roleDefault "textEditor" cfg.textEditor)
        (roleDefault "officeWriter" cfg.officeWriter)
        (roleDefault "officeSpreadsheet" cfg.officeSpreadsheet)
        (roleDefault "officePresentation" cfg.officePresentation)
        (roleDefault "mediaPlayer" cfg.mediaPlayer)
        (roleDefault "torrentClient" cfg.torrentClient)
        (roleDefault "fileManager" cfg.fileManager)
      ];
    };
  };
}
