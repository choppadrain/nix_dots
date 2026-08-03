{ self, inputs, ... }: {
  flake.modules.packages.tmux =
    {
      pkgs,
      wlib,
      config,
      lib,
      ...
    }:
    {
      config = {
        configBefore = ''

        '';

        configAfter = ''

        '';
      };
    };
  perSystem =
    { pkgs, ... }:
    {
      packages.starship = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ self.modules.packages.tmux ];
      };
    };

}
