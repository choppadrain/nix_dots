{self, ...}:{ 
flake.wrappers.neovim = 
{ wlib, config, pkgs, lib, inputs, ... }:{

  imports = [ wlib.wrapperModules.neovim ];
  
  config.package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
  specs.general = with pkgs.vimPlugins; [
  	
  ];

  extraPackages = with pkgs; [

  ];
  settings.config_directory = ./.; # or lib.generators.mkLuaInline "vim.fn.stdpath('config')";
};
perSystem = {pkgs, self, inpits, ...}:{
	 packages.nvim = self.wrappers.neovim;
};
}
