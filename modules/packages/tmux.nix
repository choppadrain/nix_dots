{ config, inputs, ... }: {
  osama.modules.tmux =
    {
      pkgs,
      wlib,
      lib,
      ...
    }:
    {

      imports = [ wlib.wrapperModules.tmux ];
      config = {
        configBefore = ''
          set -g default-shell ${lib.getExe inputs.self.packages.${pkgs.system}.zsh}
          set -g default-command ${lib.getExe inputs.self.packages.${pkgs.system}.zsh}

          set -a terminal-features "tmux-256color:RGB"
          set -g default-terminal "xterm-256color"
          set -g extended-keys on
          set -g prefix C-SPACE
          set -g base-index 1
          set -g renumber-windows on   
          set -g mode-keys vi
          set -g status-position top
          set -g status-justify absolute-centre
          set -g status-style "bg=default"
          set -g status-left "#S"
          set -g status-right ""

          set -g window-status-current-style "fg=blue bold"
          set -s set-clipboard on
          set -s escape-time 0
          set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
        '';

        configAfter = ''

        '';
      };
    };
  perSystem =
    { pkgs, ... }:
    {
      packages.tmux = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ config.osama.modules.tmux ];
      };
    };

}
