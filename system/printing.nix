{ pkgs, ... }:
{
environment.systemPackages = with pkgs; [
    system-config-printer
    hplipWithPlugin 
  ];
  
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ]; 
  };
}