{
  browser = {
    mimeTypes = [
      "text/html"
      "application/xhtml+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
    ];
    applications = {
      brave = {
        desktop = "brave-browser.desktop";
        enable = [
          "programs"
          "browsers"
          "brave"
          "enable"
        ];
      };
      chrome = {
        desktop = "google-chrome.desktop";
        enable = [
          "programs"
          "browsers"
          "chrome"
          "enable"
        ];
      };
      firefox = {
        desktop = "firefox.desktop";
        enable = [
          "programs"
          "browsers"
          "firefox"
          "enable"
        ];
      };
    };
  };

  imageViewer = {
    mimeTypes = [
      "image/jpeg"
      "image/png"
      "image/gif"
      "image/webp"
      "image/bmp"
      "image/tiff"
      "image/avif"
    ];
    applications = {
      imv = {
        desktop = "imv.desktop";
        enable = [
          "programs"
          "media"
          "imv"
          "enable"
        ];
      };
    };
  };

  imageEditor = {
    mimeTypes = [
      "image/x-xcf"
      "image/vnd.adobe.photoshop"
    ];
    applications = {
      gimp = {
        desktop = "gimp.desktop";
        enable = [
          "programs"
          "graphics"
          "gimp"
          "enable"
        ];
      };
    };
  };

  codeEditor = {
    mimeTypes = [
      "image/svg+xml"
      "text/x-csrc"
      "text/x-c++src"
      "text/x-python"
      "text/x-java"
      "text/x-rust"
      "text/x-go"
    ];
    applications = {
      vscode = {
        desktop = "code.desktop";
        enable = [
          "programs"
          "dev"
          "vscode"
          "enable"
        ];
      };
    };
  };

  pdfViewer = {
    mimeTypes = [
      "application/pdf"
      "application/postscript"
      "application/epub+zip"
      "image/vnd.djvu"
    ];
    applications = {
      evince = {
        desktop = "org.gnome.Evince.desktop";
        enable = [
          "programs"
          "office"
          "evince"
          "enable"
        ];
      };
      okular = {
        desktop = "org.kde.okular.desktop";
        enable = [
          "programs"
          "office"
          "okular"
          "enable"
        ];
      };
      zathura = {
        desktop = "org.pwmt.zathura.desktop";
        enable = [
          "programs"
          "office"
          "zathura"
          "enable"
        ];
      };
    };
  };

  textEditor = {
    mimeTypes = [
      "text/plain"
      "text/markdown"
      "application/json"
      "application/xml"
      "application/x-yaml"
      "application/toml"
      "application/x-shellscript"
    ];
    applications = {
      gnome-text-editor = {
        desktop = "org.gnome.TextEditor.desktop";
        enable = [
          "programs"
          "notes"
          "gnome-text-editor"
          "enable"
        ];
      };
      vscode = {
        desktop = "code.desktop";
        enable = [
          "programs"
          "dev"
          "vscode"
          "enable"
        ];
      };
    };
  };

  officeWriter = {
    mimeTypes = [
      "application/vnd.oasis.opendocument.text"
      "application/vnd.oasis.opendocument.text-template"
      "application/msword"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/rtf"
    ];
    applications = {
      libreoffice = {
        desktop = "writer.desktop";
        enable = [
          "programs"
          "office"
          "libreoffice"
          "enable"
        ];
      };
    };
  };

  officeSpreadsheet = {
    mimeTypes = [
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.oasis.opendocument.spreadsheet-template"
      "application/vnd.ms-excel"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    ];
    applications = {
      libreoffice = {
        desktop = "calc.desktop";
        enable = [
          "programs"
          "office"
          "libreoffice"
          "enable"
        ];
      };
    };
  };

  officePresentation = {
    mimeTypes = [
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.oasis.opendocument.presentation-template"
      "application/vnd.ms-powerpoint"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    ];
    applications = {
      libreoffice = {
        desktop = "impress.desktop";
        enable = [
          "programs"
          "office"
          "libreoffice"
          "enable"
        ];
      };
    };
  };

  mediaPlayer = {
    mimeTypes = [
      "video/mp4"
      "video/x-matroska"
      "video/webm"
      "video/quicktime"
      "video/mpeg"
      "video/x-msvideo"
      "audio/mpeg"
      "audio/flac"
      "audio/ogg"
      "audio/wav"
    ];
    applications = {
      mpv = {
        desktop = "mpv.desktop";
        enable = [
          "programs"
          "media"
          "mpv"
          "enable"
        ];
      };
    };
  };

  torrentClient = {
    mimeTypes = [
      "application/x-bittorrent"
      "x-scheme-handler/magnet"
    ];
    applications = {
      qbittorrent = {
        desktop = "org.qbittorrent.qBittorrent.desktop";
        enable = [
          "programs"
          "network"
          "qbittorrent"
          "enable"
        ];
      };
    };
  };

  fileManager = {
    mimeTypes = [
      "inode/directory"
    ];
    applications = {
      nautilus = {
        desktop = "org.gnome.Nautilus.desktop";
        enable = [
          "programs"
          "file-managers"
          "nautilus"
          "enable"
        ];
      };
      nemo = {
        desktop = "nemo.desktop";
        enable = [
          "programs"
          "file-managers"
          "nemo"
          "enable"
        ];
      };
      thunar = {
        desktop = "thunar.desktop";
        enable = [
          "programs"
          "file-managers"
          "thunar"
          "enable"
        ];
      };
    };
  };
}
