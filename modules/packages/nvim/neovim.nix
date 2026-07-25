{ self, inputs, ... }:

{
  flake.modules.nixos.nvim =
    {
      wlib,
      pkgs,
      lib,
      config,
      ...
    }:
    {

      imports = [ wlib.wrapperModules.neovim ];

      options = {
        impure = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "if true, uses lua folder as usual vim, with no need to rebuild";
        };

        initLua = lib.mkOption {
          type = wlib.types.stringable;
          default = ./.;
        };

        impureInitLua = lib.mkOption {
          type = lib.types.either wlib.types.stringable lib.types.luaInline;
          default = lib.generators.mkLuaInline "vim.uv.os_homedir() .. '/mainconf/modules/packages/nvim'";
        };
      };

      config = {
        specs.general = with pkgs.vimPlugins; [
          lz-n
          snacks-nvim
          #completions

          luasnip

          blink-cmp
          blink-ripgrep-nvim
          nvim-treesitter.withAllGrammars
          nvim-lspconfig

          undotree
          conform-nvim

          #colorscheme
          vague-nvim
        ];

        specs.lazyPlugins = with pkgs.vimPlugins; [
          gitsigns-nvim
          nvim-autopairs
          lualine-nvim
          nvim-web-devicons

        ];

        runtimePkgs = with pkgs; [
          #language servers
          lua-language-server
          gopls

          nixd
          tinymist

          #formatters
          stylua
          gofumpt
          nixfmt
        ];

        settings.config_directory = if config.impure then config.impureInitLua else config.initLua;

        settings.dont_link = true;
        binName = lib.mkIf config.impure "nvimImpure";

        specs.initLua = {
          data = null;
          before = [ "MAIN_INIT" ];
          config = ''
            require('init')
          '';
        };

      };
    };

  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.neovim = inputs.wrappers.wrappers.neovim.wrap {
        imports = [ self.modules.nixos.nvim ];
        inherit pkgs;
      };

      packages.neovimImpure = inputs.wrappers.wrappers.neovim.wrap {
        imports = [ self.modules.nixos.nvim ];
        impure = true;
        inherit pkgs;
      };
    };
}
