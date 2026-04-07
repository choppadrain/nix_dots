{ self, inputs, ... }:
{
  flake.nvimWrapped =
    {
      wlib,
      pkgs,
      ...
    }:
    {

      imports = [ wlib.wrapperModules.neovim ];

      config = {
        package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
        specs.general = with pkgs.vimPlugins; [
          #completions
          nvim-treesitter.withAllGrammars
          nvim-lspconfig
          luasnip
          blink-cmp
          friendly-snippets

          undotree

          #colorscheme
          vague-nvim
        ];

        extraPackages = with pkgs; [
          lua-language-server
          gopls
          nixd
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
      packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
        imports = [ self.nvimWrapped ];
        inherit pkgs;
      };
    };
}
