{
  config,
  pkgs,
  userConfig,
  hostName,
  ...
}:
{
  programs.home-manager.enable = true;

  home.sessionVariables = {
    NIX_MANAGED = "1";
  };

  home = {
    username = userConfig.user.name;
    homeDirectory = userConfig.homeDirectory;
    stateVersion = "25.11";
  };
}
