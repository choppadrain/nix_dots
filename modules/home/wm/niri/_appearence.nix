{ ... }:
{
  flake.homeModules.niri =
    { osConfig, ... }:
    {
      programs.niri.settings = {
        layout = {
          shadow = {

          };
          border = {
            width = 4;
            active = with osConfig.scheme.withHashtag; [ red ];
          };
        };
      };
    };
}
