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
}
