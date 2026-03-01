{
  pkgs,
  inputs,
  ...
}: {
 home.file.".config/nvim".source = ./nvim;
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    extraPackages = with pkgs; [
	    lua-language-server
	    alejandra
	    go
	    gopls
	    stylua
	];
	plugins = with pkgs.vimPlugins; [
	    nvim-lspconfig
	    nvim-treesitter.withAllGrammars

	    blink-cmp
	    nvim-web-devicons
	    lazy-nvim
	    
	    vague-nvim
	    lualine-nvim
	    luasnip
	    snacks-nvim
	];
  };
}
