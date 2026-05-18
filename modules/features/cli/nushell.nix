{ self, ... }:
{
  flake.modules.nixos.nushell = {
    home-manager.sharedModules = [
      self.modules.homeManager.nushell
    ];
  };

  flake.modules.homeManager.nushell = {
    programs.nushell = {
      enable = true;
      extraConfig = ''
                $env.STARSHIP_SHELL = "nu"
                $env.EDITOR = "nvim"
                $env.VISUAL = "nvim"
                $env.PROMPT_INDICATOR_VI_INSERT = " ❯ "
                $env.PROMPT_INDICATOR_VI_NORMAL = " │ "
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
