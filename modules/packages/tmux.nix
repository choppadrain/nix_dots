{ inputs,config,scheme, ... }: let
    test = scheme.red;

in
{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.tmux = inputs.wrappers.lib.wrapPackage (
      {
        inherit pkgs;
            plugins = with pkgs.tmuxPlugins; [
            ];

            configBefore = ''
              ${test}
              setw -g pane-base-index 1
              set-option -g status-position top

              set -g mouse on
              set -g base-index 1
              set -g default-terminal "screen-256color"
              set -g status-justify center

              set -g prefix C-a
              unbind C-b
              bind-key C-a send-prefix
              set -s escape-time 0
            '';
      });
    };
    flake.modules.homeManager.tmux = {
        home.packages = [];
    };
}
