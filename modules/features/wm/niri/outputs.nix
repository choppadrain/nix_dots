{ ... }:
{
  flake.homeModules.niri =
    { ... }:
    {
      programs.niri = {
        settings = {

          outputs = {
            "DP-2" = {
              mode = {
                width = 1920;
                height = 1080;
                refresh = 120.0;
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
