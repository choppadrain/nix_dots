{ self, inputs, ... }:
{
  flake.nvimWrapped = {config,wlib,pkgs, ...}:{

      imports = [ wlib.wrapperModules.neovim ];

      config = 
{
      package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
      specs.general = with pkgs.vimPlugins; [
	   nvim-treesitter.withAllGrammars
      ];

      extraPackages = with pkgs; [
      ];
      settings.config_directory = ./.; # or lib.generators.mkLuaInline "vim.fn.stdpath('config')";
	};
    };
  perSystem =
    {
      pkgs,
      self',
      ...
    }:
    {
      packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
      	imports = [ self.nvimWrapped];
	inherit pkgs;
      };
    };
}

