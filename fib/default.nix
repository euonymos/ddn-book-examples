let
  pkgs = import <nixpkgs> {};
  script = ''
    fib() {
      if test '(' "x$1" = x0 ')' -o '(' "x$1" = x1 ')'
        then
          echo $1
          exit 0
      fi
      echo $(($(fib $(($1 - 1))) + $(fib $(($1 - 2)))))
      exit 0
    }
    echo $(fib $THEINPUT) > $out
  '';
in builtins.derivation rec {
  THEINPUT = 10;
  name = "fib-" + (toString THEINPUT);
  system = "x86_64-linux";
  builder = "${pkgs.bash}/bin/bash";
  args = [ "-c" script ];
}