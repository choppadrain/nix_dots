{ self, inputs, ... }:
{
  flake.modules.homeManager.tmux =
    { pkgs, wlib, ... }:
    {
      imports = [ wlib.wrapperModules.tmux ];
        config = {
            plugins = with pkgs.tmuxPlugins; [];
        };


    };





  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.zsh = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ self.modules.home.zsh ];
      };
    };
}
