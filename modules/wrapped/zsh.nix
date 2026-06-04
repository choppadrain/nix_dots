{ inputs, ... }:
{
  flake.modules.home.zsh =
    { wlib, ... }:
    {
      imports = [ wlib.wrapperModules.zsh ];
      config = {

      };
    };
}
