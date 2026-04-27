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
        ubind -a -T root
        
        

        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-9 select-window -t 9

        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R

        bind -n M-S-h resize-pane -L 5
        bind -n M-S-j resize-pane -D 5
        bind -n M-S-k resize-pane -U 5 
        bind -n M-S-l resize-pane -R 5

        bind -n M-Enter new-window
        bind 



        setw -g move-keys vi
        setw -g pane-base-index 1

        set -g base-index 1
        set -g default-terminal "kitty"
        
        set -s ecape-time 0
        
        
        set -g status-style "bg=default,fg=black,bright"
        set -g status-left "#S"
        set -g status-right "#[fg=black, bright]#S"
        set -g status-justify absolute-centre
        set -g window-status-current-style "fg=blue bold"
        set -g status-position top

        set -g mouse on

        set -g renumber-windows on
        set -sg terminal-overrides ",*:RGB"

      '';
    };

  };
}
