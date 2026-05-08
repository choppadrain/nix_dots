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
        $env.config = {
            show_banner: false
            edit_mode: vi

            keybindings: [
                {
                    name: normal_j
                    modifier: none
                    keycode: char_j
                    mode: vi_normal
                    event: { send: NextHistory }
                }
                {
                    name: normal_k
                    modifier: none
                    keycode: char_k
                    mode: vi_normal
                    event: { send: PreviousHistory }
                }
            ]
        }
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
                		'';
    };
  };
}
