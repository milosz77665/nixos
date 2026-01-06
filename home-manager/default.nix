{
  config,
  pkgs,
  userConfig,
  hostName,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = userConfig.user.name;
    homeDirectory = userConfig.homeDirectory;
    stateVersion = "25.11";
  };
}
