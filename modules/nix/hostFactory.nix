{
  withSystem,
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.osama;
in
{

  config =
    let
      mkSystem =
        platform: builder:
        cfg.configurations
        |> lib.filterAttrs (_: hostConfig: hostConfig.platform == platform)
        |> lib.mapAttrs (
          name: hostConfig:
          withSystem hostConfig.system (
            {
              hostname,
              inputs,
              ...
            }:
            builder {
              specialArgs = {
                inherit
                  hostname
                  inputs
                  ;
                inherit (hostConfig) hardware theme;
                constants =
                  let
                    homePath = (
                      if platform == "darwin" then "/Users/${hostConfig.user}" else "/home/${hostConfig.user}"
                    );
                  in
                  {
                    username = hostConfig.user;
                    stateVersion = hostConfig.stateVersion;
                    homeDir = homePath;
                  };
              };
              modules = hostConfig.modules ++ [
                cfg.hardware.${hostConfig.user}
                cfg.skeleton
                cfg.core
              ];
            }
          )
        );
    in
    {
      flake.nixosConfigurations = mkSystem "nixos" inputs.nixpkgs.lib.nixosSystem;
      flake.darwinConfigurations = mkSystem "darwin" inputs.nix-darwin.darwinSystem;
    };

  options.osama = {
    configurations = lib.mkOption {
      description = "nix configurations";
      default = { };
      type = lib.types.attrsof (
        lib.types.submodule {
          options = {
            platform = lib.mkOption {
              type = lib.types.enum [
                "nixos"
                "darwin"
              ];
            };

            system = lib.mkOption {
              type = lib.types.str;
              default = "x86_64-linux";
              description = "system architecture";
            };

            modules = lib.mkOption {
              type = lib.types.listof lib.types.deferredmodule;
              default = [ ];
              description = "additional modules";
            };

            hardware = lib.mkOption {
              type = lib.types.str;
              default = "";
              description = "hardware profile of the system";
            };

            users = lib.mkOption {
              type = lib.types.listof lib.types.deferredmodule;
              default = throw "configuration failed: you must define a user ";
              descriptions = "defining a users";
            };

            theme = lib.mkOption {
              type = lib.types.enum [
              ];
            };

            extraConfig = lib.mkOption {
              type = lib.types.deferredmodule;
              default = { };
              description = "configuration specific things";
            };
            stateVersion = lib.mkOption {
              type = lib.types.str;
              default = throw "configuration failed: specify systemState version";
              description = "system state version";
            };

          };
        }
      );
    };

    mods = lib.mkOption {
      type = lib.types.lazyattrsof lib.types.deferredmodule;
    };
    host = lib.mkOption {
      type = lib.types.lazyattrsof lib.types.deferredmodule;
    };
    core = lib.mkOption {
      type = lib.types.deferredmodule;
    };
    skeleton = lib.mkOption {
      type = lib.types.deferredmodule;
    };
    hardware = lib.mkOption {
      type = lib.types.lazyattrsof lib.types.deferredmodule;
    };

  };
}
