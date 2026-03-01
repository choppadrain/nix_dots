{...}: {
  programs = {
    nushell = {
      extraConfig = ''
	$env.EDITOR = "nvim"
	$env.VISUAL = "nvim"
	$env.config.edit_mode = 'vi'

$env.config = ($env.config | upsert show_banner false)

        }
      '';
      shellAliases = {
        yazi = "yz";
        clear = "c";
      };
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
