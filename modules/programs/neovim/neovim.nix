{ self, ... }:
{
  flake.nvimWrapper =
    {
      wlib,
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.neovim ];

      options.settings.nvim_test = lib.mkOption {
        description = "if true use impure config";
        type = lib.types.bool;
        default = false;

      };

      config.settings.config_directory =
        if config.settings.nvimTest then
          config.settings.unwrapped_config
        else
          config.settings.wrapped_config;
      options.settings.wrapped_config = lib.mkOption {
        type = wlib.types.stringable;
        default = ./.;
      };

      config.settings.unwrapped_config = lib.mkOption {
        type = wlib.types.stringable lib.types.luaInLine;
        default = lib.generators.mkLuaLine "vim.uv.os_homedir() .. 'nix_dots/modules/programs/neovim'";

      };
      config.settings.dont_link = config.binName != "nvim";
      config.binName = lib.mkIf config.settings.nvimTest (lib.mkDefault "nvim-test");

      specs.general = with pkgs.vimPlugins; [
        # plugins which are loaded at startup ...
      ];
      specs.lazy = {
        lazy = true;
        data = with pkgs.vimPlugins; [
          # plugins which are not loaded until you vim.cmd.packadd them ...
        ];
      };
      extraPackages = with pkgs; [
        # lsps, formatters, etc...
      ];
      flake.nixosModules.neovim = {
        perSystem =
          {
            self,
            pkgs,
            inputs,
            ...
          }:
          {
            packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
              inherit pkgs;
              imports = [ self.nvimWrapper ];
            };
            packages.neovim-test = inputs.wrapper-modules.wrappers.neovim.wrap {
              settings.nvim-test = true;
              inherit pkgs;
              imports = [ self.nvimWrapper ];
            };

          };
      };
    };
}
