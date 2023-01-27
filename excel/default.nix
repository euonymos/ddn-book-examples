let
  pkgs = import <nixpkgs> {};

  mkCell = all@{cell, formula, ...}:
    builtins.derivation (rec {
      system = builtins.currentSystem;
      name = "${cell}";
      builder = "${pkgs.bash}/bin/bash";
      args = [ "-c" formula ];
    } // all);

  sum = ''
    L=$(<$left)
    R=$(<$right)
    echo $(($L + $R)) > $out
    '';

in rec {
  a1 = pkgs.writeText "A1" "11";
  a2 = pkgs.writeText "A2" "20";

  b1 = mkCell
    { cell = "B1";
      formula = sum;
      left = a1;
      right = a2;
    };
}