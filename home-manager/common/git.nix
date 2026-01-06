{ userConfig, ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = userConfig.git.username;
      email = userConfig.git.email;
    };
  };
}
