{
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.dconf.enable = true;
  services.tumbler.enable = true;

  boot.supportedFilesystems = [ "ntfs" ];
}
