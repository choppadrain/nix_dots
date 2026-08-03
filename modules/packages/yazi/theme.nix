{ scheme, ... }:
{
  flake.modules.homeManager.yazi =
    { ... }:
    {
      config.settings.theme = {
        status = {
          sep_left = {
            open = "█";
            close = "█";
          };
          sep_right = {
            open = "█";
            close = "█";
          };
        };

        indicator = {
          padding = {
            open = "█";
            close = "█";
          };
        };
      };

    };
}
