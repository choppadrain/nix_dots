{ inputs, ... }:
{
  flake.modules.home.scroll =
    {
      lib,
      pkgs,
      wlib,
      ...
    }:
    {
      imports = [ wlib.modules.default ];

      options = {
        extraSessionVariables = lib.mkOption {
          type = lib.types.lines;
          default = "";
        };

      };

      config = {
        package = inputs.scroll;

        extraPackages = with pkgs; [

        ];
      };

    };
}
