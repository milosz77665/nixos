{ lib, localLib }:
let
  mkPackage = name: drvPath: {
    type = "derivation";
    inherit name drvPath;
  };
in
{
  "test utils.getDuplicatePackages: should ignore identical derivations" = {
    expr = localLib.utils.getDuplicatePackages [
      (mkPackage "brave-1.0" "/nix/store/brave-a.drv")
      (mkPackage "brave-1.0" "/nix/store/brave-a.drv")
      (mkPackage "firefox-2.0" "/nix/store/firefox-a.drv")
    ];

    expected = { };
  };

  "test utils.getDuplicatePackages: should report the same package with different derivations" = {
    expr = localLib.utils.getDuplicatePackages [
      (mkPackage "brave-1.0" "/nix/store/brave-a.drv")
      (mkPackage "brave-1.0" "/nix/store/brave-b.drv")
    ];

    expected = {
      "brave-1.0" = [
        "/nix/store/brave-a.drv"
        "/nix/store/brave-b.drv"
      ];
    };
  };

  "test utils.getDuplicatePackages: should ignore different packages" = {
    expr = localLib.utils.getDuplicatePackages [
      (mkPackage "brave-1.0" "/nix/store/brave-a.drv")
      (mkPackage "firefox-2.0" "/nix/store/firefox-a.drv")
    ];

    expected = { };
  };

  "test utils.getDuplicatePackages: should ignore non-derivations" = {
    expr = localLib.utils.getDuplicatePackages [
      (mkPackage "brave-1.0" "/nix/store/brave-a.drv")
      { }
    ];

    expected = { };
  };
}
