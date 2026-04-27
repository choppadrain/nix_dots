{ ... }:
{
  flake.homeModules.niri =
    { ... }:
    {
      programs.niri = {
        settings = {

          outputs = {
            "DP-2" = {
              scale = 1.0;
              mode = {
                width = 1920;
                height = 1080;
                refresh = 143.981;
              };
              position = {
                y = 0;
                x = 0;
              };
            };
          };
        };
      };
    };
}
