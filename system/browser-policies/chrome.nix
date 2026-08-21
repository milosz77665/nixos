{
  config,
  lib,
  ...
}:
let
  cfg = config.sys.browser-policies.chrome;
in
{
  options.sys.browser-policies.chrome = {
    enable = lib.mkEnableOption "Chrome policies";
  };

  config = lib.mkIf cfg.enable {
    environment.etc."opt/chrome/policies/managed/managed_policies.json".text = builtins.toJSON {

      ExtensionInstallForcelist = [
        "cfhdojbkjhnklbpkdaibdccddilifddb" # Adblock Plus
        "fmkadmapgofadopljbjfkapdkoienihi" # React Developer Tools
        "lmhkpmbekcpmknklioeibfkpmmfibljd" # Redux DevTools
        "lomlmaamgdjplnhhgnoajlbnlgnpkobl" # Video Popout
        "nhdogjmejiglipccpnnnanhbledajbpd" # Vue.js devtools
        "jchobbjgibcahbheicfocecmhocglkco" # URLs Cleaner
        "lphicbbhfmllgmomkkhjfkpbdlncafbn" # LetyShops
        "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      ];

      RestoreOnStartup = 5;
    };
  };
}
