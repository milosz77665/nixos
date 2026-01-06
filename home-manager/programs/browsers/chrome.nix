{
  programs.google-chrome = {
    enable = true;
    commandLineArgs = [
      "--force-dark-mode"
      "--restore-last-session"
    ];
  };
}
