{
  config,
  pkgs,
  vars,
  hostName,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = vars.user.name;
    homeDirectory = vars.homeDirectory;
    stateVersion = "25.11";
  };
}
