{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";

      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/gif" = "imv.desktop";
      
      "image/svg" = "code.desktop";

      "application/pdf" = "org.kde.okular.desktop";

      "text/plain" = "org.gnome.TextEditor.desktop";

      "inode/directory" = "nemo.desktop";
    };
  };
}
