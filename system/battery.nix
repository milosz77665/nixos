{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.battery;
in
{
  options.sys.battery = {
    enable = lib.mkEnableOption "Battery";
  };

  config = lib.mkIf cfg.enable {
    services.tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_SAV = "power";
      };
    };
  };
}
