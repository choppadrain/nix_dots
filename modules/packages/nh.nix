{ inputs, self, ... }: {
  flake.modules.packages.nh =
    {
      pkgs,
      lib,
      wlib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.nh ];
      config = {
        flake = lib.mkDefault (
          if pkgs.stdenv.isDarwin then "/Users/choppadrain/nix_dots" else "/home/choppadrain/nix_dots"
        );
      };
    };
  perSystem = { pkgs, ... }: {
    packages.nh = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      imports = [ self.modules.packages.nh ];
    };
  };
}
