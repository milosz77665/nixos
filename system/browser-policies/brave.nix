{
  environment.etc."brave/policies/managed/extensions.json".text = builtins.toJSON {

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
    BraveRewardsDisabled = true;
    BraveWalletDisabled = true;
  };
}
