{ inputs, lib, ... }:
{
  flake.homeModules.niri = {
    programs.niri.config = with inputs.niri lib.kdl; [
      (node "blur" [
        (flag "on")
        (leaf "passes" 3)
        (leaf "offset" 3)
        (leaf "noise" 0.02)
        (leaf "saturation" 1.5)
      ])
    ];
  };
}
