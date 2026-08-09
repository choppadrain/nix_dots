{
  withSystem,
  config,
  lib,
  self,
  inputs,
  ...
}:
let
  cfg = config.osama;
in
{

  config =
    let
      mkDarwin =
        cfg.configurations
        |> lib.mapAttrs (
          hostname: hostConfig:
          withSystem hostConfig.system (
            { ... }:
            inputs.nix-darwin.lib.darwinSystem {
              specialArgs = {
                inherit hostname inputs;
                inherit (hostConfig) theme;
                constants = {
                  theme = hostConfig.theme;
                  platform = hostConfig.platform;
                  username = hostConfig.user;
                  stateVersion = hostConfig.stateVersion;
                  homeDir = "/Users/${hostConfig.user}";
                };
              };
              modules = hostConfig.modules ++ [
                cfg.modules.darwinModule # since there is no hardware for macos in nix, i am defining a module with macos only settings
                hostConfig.extraConfig
                cfg.common
                cfg.backend
              ];
            }
          )
        );

      mkNixos =
        cfg.configurations
        |> lib.mapAttrs (
          hostname: hostConfig:
          withSystem hostConfig.system (
            { inputs, ... }:
            inputs.nixpkgs.lib.nixosSystem {
              specialArgs = {
                inherit hostname inputs;
                inherit (hostConfig) hardware theme;
                constants = {
                  platform = hostConfig.platform;
                  username = hostConfig.user;
                  stateVersion = hostConfig.stateVersion;
                  homeDir = "/home/${hostConfig.user}";
                };
              };
              modules = hostConfig.modules ++ [
                cfg.hardware.${hostConfig.user}
                hostConfig.extraConfig
                cfg.common
                cfg.backend
              ];
            }
          )
        );
    in
    {
      flake.nixosConfigurations = mkNixos;
      flake.darwinConfigurations = mkDarwin;

      osama.modules.darwinModule = { constants, ... }: {
        nixpkgs.hostPlatform = "aarch64-darwin";
        system.configurationRevision = self.rev or self.dirtyRev or null;
        users.users."${constants.username}" = {
          name = "${constants.username}";
          home = "${constants.homePath}";
        };
        system.primaryUser = "${constants.username}";
        system.stateVersion = constants.stateVersion; # todo: move this to a nix settings file
      };
    };

  options.osama = {
    configurations = lib.mkOption {
      description = "nix configurations";
      default = { };
      type = lib.types.attrsOf (
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
              type = lib.types.listOf lib.types.deferredModule;
              default = [ ];
              description = "additional modules";
            };

            hardware = lib.mkOption {
              type = lib.types.str;
              default = "";
              description = "hardware profile of the system";
            };

            user = lib.mkOption {
              type = lib.types.str;
              default = throw "configuration failed: you must define a user ";
              description = "defining a users";
            };

            theme = lib.mkOption {
              type = lib.types.enum [
                "vague"
                "yoru"
              ];
            };

            extraConfig = lib.mkOption {
              type = lib.types.deferredModule;
              default = { };
              description = "configuration specific things";
            };

            stateVersion = lib.mkOption {
              type = lib.types.either lib.types.str lib.types.int;
              default = throw "configuration failed: specify systemState version";
              description = "system state version";
            };

          };
        }
      );
    };

    modules = lib.mkOption {
      default = { };
      type = lib.types.lazyAttrsOf lib.types.deferredModule;

    };
    host = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };
    common = lib.mkOption {
      type = lib.types.deferredModule;
    };
    backend = lib.mkOption {
      type = lib.types.deferredModule;
    };
    hardware = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };

  };
}
