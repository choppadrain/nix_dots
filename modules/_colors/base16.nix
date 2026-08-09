{ inputs, ... }: {
  osama.backend =
    {
      lib,
      theme,
      config,
      ...
    }:
    {
      imports = [ inputs.base16.nixosModule ]; # nixos module which is not actually nixos module
      options.theme = {
        variant = lib.mkOption {
          type = lib.types.enum [
            "vague"
            "yoru"
          ];
          default = "vague";
          description = "pick a theme";
        };

        vague = lib.mkOption {
          type = lib.types.attrs;
          default = { };
          description = "yoru theme ";
        };

        yoru = lib.mkOption {
          type = lib.types.attrs;
          default = { };
          description = "yoru theme ";
        };
      };
      config =
        let
          scheme = config.theme.${theme};
        in
        {
          inherit scheme;

          _module.args = {
            inherit (config) scheme;
          };
        };
    };
}
