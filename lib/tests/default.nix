let
  esc = builtins.fromJSON ''"\u001b"'';
  reset = "${esc}[0m";
  bold = "${esc}[1m";
  red = "${esc}[31m";
  green = "${esc}[32m";
  yellow = "${esc}[33m";

  flakeLock = builtins.fromJSON (builtins.readFile ../../flake.lock);
  pinnedNixpkgs = builtins.fetchTree flakeLock.nodes.nixpkgs.locked;
  lib = (import pinnedNixpkgs { }).lib;

  localLib = import ../default.nix {
    inputs = { };
    inherit lib;
  };

  allTests =
    (import ./utils/getDirectories.test.nix { inherit lib localLib; })
    // (import ./utils/getModuleDirectories.test.nix { inherit lib localLib; })
    // (import ./utils/getOptionPaths.test.nix { inherit lib localLib; })
    // (import ./utils/getFiles.test.nix { inherit lib localLib; })
    // (import ./utils/getOrphanModuleFiles.test.nix { inherit lib localLib; })
    // (import ./utils/checkVarsSchema.test.nix { inherit lib localLib; })
    // (import ./utils/getDuplicatePackages.test.nix { inherit lib localLib; })
    // (import ./importers/mkImporter.test.nix { inherit lib localLib; })
    // (import ./importers/mkModulesImporter.test.nix { inherit lib localLib; });

  testResults = lib.runTests allTests;
in

if testResults == [ ] then
  "${green}${bold}TESTS PASSED!${reset}"
else
  throw ''
    ${red}${bold}TESTS FAILED!${reset}

    ${lib.concatMapStringsSep "\n" (err: ''
      ${red}TEST FAILED: ${reset}${bold}${err.name}${reset}
          ${yellow}Expected:${reset} ${builtins.toJSON err.expected}
          ${yellow}Actual:${reset}   ${builtins.toJSON err.result}
    '') testResults}
  ''
