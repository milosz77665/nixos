{ userConfig, ... }:
{
  users.users.${userConfig.user.name} = {
    isNormalUser = true;
    description = userConfig.user.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
      "wireshark"
      "docker"
    ];
  };
}
