{pkgs, ...}: {
    programs.nushell = {
	enable = true;
	extraConfig = ''
	    $env.EDITOR = 'nvim'
	    $env.config = { 
	    buffer_editor: 'nvim'
	    show_banner: false
	    edit_mode: 'vi'
	    }
	    $env.path
	'';
	shellAliases = {
	    vim = "nvim";
	    vi = "nvim";
	};
    };
}
