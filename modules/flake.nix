{
  description = "The Answer to the Ultimate Question of Life";
  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  outputs = {self, nixpkgs}: {
    decimalTypeDef = with builtins; {
      name = "decimal";
      check = x: isInt x && x >= 0 && x<= 9;
      merge = _: defs: foldl' (acc: x: acc * 10 + x.value) 0 defs;
    };
    nixosModules = {
      m1 = {config, lib, pkgs, ...}: {
        options = {
          decimal = lib.mkOption {
            type = lib.mkOptionType self.decimalTypeDef;
          };
        };
        config = { decimal = 4; };
      };
      m2 = {config, lib, pkgs, ...}: {
        decimal = lib.mkAfter 2;
      };
    };
    evaluatedModule = nixpkgs.lib.evalModules {
      modules = with self.nixosModules; [ m1 m2 ];
    };
  };
}
