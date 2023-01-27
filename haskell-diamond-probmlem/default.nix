# Note: This should fail to build
let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          project =
            haskellPackagesNew.callPackage ./project.nix { };

          foo =
            # cabal2nix cabal://extra-1.7.12 > foo.nix
            # /nix/store/r8n2r1cz4apdrgn4hs4jhjcijvc1pvv5-extra-1.7.12.drv
            # /nix/store/iqvn8pxji0i40bnh7jxvw343fyi341bc-extra-1.7.12
            haskellPackagesNew.callPackage ./foo.nix { };
          bar =
            # cabal2nix cabal://extra-1.7.11 > bar.nix
            # /nix/store/bsfv8s0ny4r5xf2h6vbry0aqg36d9f6p-extra-1.7.11.drv
            # /nix/store/xpnn5zsx2749cwkdj8a3xpm3dwckrg4k-extra-1.7.11
            haskellPackagesNew.callPackage ./bar.nix { };

        };
      };
    };
  };

  pkgs = import <nixpkgs> { inherit config; };
in
  { project = pkgs.haskellPackages.project;
  }