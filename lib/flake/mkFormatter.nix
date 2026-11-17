{ lib, nixpkgs }:
lib.genAttrs [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ] (
  system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
  in
  pkgs.writeShellApplication {
    name = "nixfmt";
    runtimeInputs = [
      pkgs.git
      pkgs.nixfmt
    ];
    text = ''
      files=()
      options=()

      for arg in "$@"; do
        case "$arg" in
          -*) options+=("$arg") ;;
          *) files+=("$arg") ;;
        esac
      done

      if [ "''${#files[@]}" -eq 0 ]; then
        # Empty fixture .nix files are intentional and nixfmt cannot parse them.
        while IFS= read -r -d "" file; do
          if [ -s "$file" ]; then
            files+=("$file")
          fi
        done < <(git ls-files -z -- "*.nix")
      fi

      exec nixfmt "''${options[@]}" "''${files[@]}"
    '';
  }
)
