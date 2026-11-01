{
  lib,
  ...
}:
let
  applications = import ./applications.nix;

  mkRoleOption =
    role: default: description:
    lib.mkOption {
      type = lib.types.enum (builtins.attrNames applications.${role}.applications);
      inherit default;
      inherit description;
    };
in
{
  options.desktop.xdg = {
    enable = lib.mkEnableOption "XDG default applications (MIME types)";

    browser = mkRoleOption "browser" "brave" "Default browser for HTML pages and HTTP/HTTPS links.";

    imageViewer = mkRoleOption "imageViewer" "imv" "Default application for raster images.";

    imageEditor = mkRoleOption "imageEditor" "gimp" "Default application for editable image formats.";

    codeEditor = mkRoleOption "codeEditor" "vscode" "Default application for SVG and source code files.";

    pdfViewer = mkRoleOption "pdfViewer" "okular" "Default application for PDF, EPUB, DjVu and PostScript documents.";

    textEditor = mkRoleOption "textEditor" "gnome-text-editor" "Default application for plain text, Markdown and configuration files.";

    officeWriter = mkRoleOption "officeWriter" "libreoffice" "Default application for text documents.";

    officeSpreadsheet = mkRoleOption "officeSpreadsheet" "libreoffice" "Default application for spreadsheets.";

    officePresentation = mkRoleOption "officePresentation" "libreoffice" "Default application for presentations.";

    mediaPlayer = mkRoleOption "mediaPlayer" "mpv" "Default application for audio and video files.";

    torrentClient = mkRoleOption "torrentClient" "qbittorrent" "Default application for torrent files and magnet links.";

    fileManager = mkRoleOption "fileManager" "nemo" "Default application for directories.";
  };
}
