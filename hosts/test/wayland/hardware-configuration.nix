{ lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  boot.loader.grub.device = "nodev";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
