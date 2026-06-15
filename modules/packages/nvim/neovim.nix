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
          nvim-lspconfig
          snacks-nvim
          blink-ripgrep-nvim
          #completions
          nvim-web-devicons

          nvim-treesitter.withAllGrammars
          nvim-lspconfig

          fzf-lua
          luasnip
          blink-cmp

          undotree
          conform-nvim

          #colorscheme
          vague-nvim
        ];

        specs.lazyPlugins = with pkgs.vimPlugins; [
          gitsigns-nvim
          nvim-autopairs
          mini-files

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
