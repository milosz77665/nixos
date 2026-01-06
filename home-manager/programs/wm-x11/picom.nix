{
  services.picom = {
    enable = true;
    # backend = "glx";

    vSync = true;
    activeOpacity = 0.90;
    inactiveOpacity = 0.90;
    opacityRules = [
      "100:class_g = 'i3lock'"
      "100:name = 'qtile_bar'"
      "100:QTILE_INTERNAL@:32c = 1"
    ];

    fade = true;
    fadeSteps = [
      0.03
      0.03
    ];
    fadeDelta = 4;

    settings = {
      inactive-dim = 0.0;
      unredir-if-possible = false;
      inactive-opacity-override = false;

      blur = {
        method = "dual_kawase";
        strength = 3;
      };

      blur-background-exclude = [
        "class_g = 'i3lock'"
        "name = 'qtile_bar'"
        "QTILE_INTERNAL@:32c = 1"
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
    };
  };
}
