{
  withSystem,
  config,
  lib,
  inputs,
  self,
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
          hostname: hostConfig:
          withSystem hostConfig.system (
            {
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
                #since nix darwin does not require hardware module i am importing something like darwin module
                (if platform == "darwin" then cfg.mods.darwinModule else cfg.hardware.${hostConfig.user})
                # cfg.skeleton
                # cfg.core
                hostConfig.extraConfig
              ];
            }
          )
        );
    in
    {
      flake.nixosConfigurations = mkSystem "nixos" inputs.nixpkgs.lib.nixosSystem;
      flake.darwinConfigurations = mkSystem "darwin" inputs.nix-darwin.lib.darwinSystem;

      osama.mods.darwinModule = { constants, ... }: {
        nixpkgs.hostPlatform = "aarch64-darwin";
        system.configurationRevision = self.rev or self.dirtyRev or null;
        users.users."${constants.username}" = {
          name = "${constants.username}";
          home = "${constants.homePath}";
        };
        system.stateVersion = constants.stateVersion;
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

    mods = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };
    host = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };
    core = lib.mkOption {
      type = lib.types.deferredModule;
    };
    skeleton = lib.mkOption {
      type = lib.types.deferredModule;
    };
    hardware = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.deferredModule;
    };

  };
}
