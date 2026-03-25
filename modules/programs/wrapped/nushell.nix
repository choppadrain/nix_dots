{ self, ... }:
{
  flake.nixosModules.nushell = {
    home-manager.sharedModules = [
      self.homeModules.nushell
    ];
  };

  flake.homeModules.nushell = {
    programs.nushell = {
      enable = true;
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
  };
}
