{ self, ... }:
{
  flake.nixosModules.tmux = {
    home-manager.sharedModules = [
      self.homeModules.tmux
    ];
  };
  flake.homeModules.tmux = {
    programs.tmux = {
      enable = true;
      extraConfig = ''
        set -g base-index 1
        set -g default-terminal "kitty"
        set -sg terminal-overrides ",*:RGB"

        set -g status-style "bg=default,fg=black,bright"
        set -g status-left "#S"
        set -g status-right "#[fg=black, bright]#S"
        set -g status-justify absolute-centre
        set -g window-status-current-style "fg=blue bold"
        set -g status-position top

        set -g renumber-windows on
      '';
    };

  };
}
