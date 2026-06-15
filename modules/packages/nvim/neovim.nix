{ self, inputs, ... }:
{
  flake.modules.nixos.nvim =
    {
      wlib,
      pkgs,
      ...
    }:
    {

      imports = [ wlib.wrapperModules.neovim ];

      config = {
        specs.general = with pkgs.vimPlugins; [
          lz-n
          snacks-nvim
          #completions

          fzf-lua
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

        settings.config_directory = ./.;

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
    };
}
