{ inputs, ... }: {
  osama.common =
    {
      lib,
      theme,
      config,
      constants,
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
      config = {
        scheme = config.scheme."${constants.theme}";
        _module.args = {
          inherit (config) scheme;
        };
      };
    };
}
