{ vars, ... }:
{
  users.users.${vars.user.name} = {
    isNormalUser = true;
    description = vars.user.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
      "wireshark"
      "docker"
    ];
  };
}
