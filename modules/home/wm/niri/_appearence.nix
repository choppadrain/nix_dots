{ ... }:
{
  flake.homeModules.niri =
    { ... }:
    {
      programs.niri.settings = {
        layout = {
          shadow = {

          };
          border = {
            width = 4;
            active = 4;
          };
        };
      };
    };
}
