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
        # package = pkgs.neovim;
        specs.general = with pkgs.vimPlugins; [
          #completions
          nvim-web-devicons
          indent-blankline-nvim

          nvim-treesitter.withAllGrammars
          nvim-lspconfig

          fzf-lua
          luasnip
          blink-cmp
          friendly-snippets

          undotree

          #colorscheme
          vague-nvim
        ];

        runtimePkgs = with pkgs; [
          #language servers
          lua-language-server
          gopls
          nixd
          tinymist
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
