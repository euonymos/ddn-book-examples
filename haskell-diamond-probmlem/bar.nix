{ mkDerivation, base, clock, directory, filepath, lib, process
, QuickCheck, quickcheck-instances, time, unix
}:
# This mkDerivarion is haskell.mkDerivation!
mkDerivation {
  pname = "extra";
  version = "1.7.11";
  sha256 = "5ef6057ce9308187e3ee462feeaf834aa24f600619fcd2dc74c39be0017b537f";
  libraryHaskellDepends = [
    base clock directory filepath process time unix
  ];
  testHaskellDepends = [
    base directory filepath QuickCheck quickcheck-instances unix
  ];
  homepage = "https://github.com/ndmitchell/extra#readme";
  description = "Extra functions I use";
  license = lib.licenses.bsd3;
  doCheck = false;
  prePatch = ''
    substituteInPlace extra.cabal \
        --replace 'name:               extra' 'name:               bar'
  '';
}
