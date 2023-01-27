{ mkDerivation, bar, base, foo, lib }:
mkDerivation {
  pname = "nix-two-deps";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ bar base foo ];
  license = "unknown";
  mainProgram = "nix-two-deps";
}
