{ ... }:
{
  flake.homeModules.niri = {
    programs.niri.settings = {
      blur = {
        enable = true;
      };
    };
  };
}
