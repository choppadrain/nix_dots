{ inputs, self, ... }:
{
  flake.modules.homeManager.zsh =
    {
      wlib,
      pkgs,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.zsh ];
      config = {

        runtimePkgs = with pkgs; [
          ripgrep
          bat
          fd
          zoxide
        ];

        zshrc.content = ''
          source ${pkgs.zinit}/share/zinit/zinit.zsh

          # zmodload zsh/datetime
          # START_TIME=$EPOCHREALTIME
          HISTFILE=~/.zsh_history
          HISTSIZE=10000
          SAVEHIST=10000

          export KEYTIMEOUT=1


          export ZSH_CACHE_DIR=~/.cache/zsh
          mkdir -p $ZSH_CACHE_DIR
          ZVM_KEYTIMEOUT=0.01

          #===============================================
          #plugins
          #===============================================

          ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
          ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
          ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

          ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
          ZVM_CURSOR_STYLE_ENABLED=true


          #===============================================
          #aliases
          #===============================================

          alias grep="rg --color=auto"
          alias cat="bat"
          alias ls="eza --icons"
          alias ll="eza -lah --icons --git"
          alias tree=" eza --tree --icons"
          alias find="fd"
          alias c="clear"



          #==============================================
          #zinit
          #==============================================

          zinit ice wait"!0" lucid atinit'eval "$(starship init zsh)"'
          zinit light zdharma-continuum/null

          zinit ice wait"0b" lucid atinit'eval "$(zoxide init zsh)"'
          zinit light zdharma-continuum/null



          zinit ice as"completion" id-as"nix-completions" blockf
          zinit light ${pkgs.nix-zsh-completions}/share/zsh/site-functions

          fpath=(${pkgs.nix}/share/zsh/site-functions $fpath)

          zinit ice wait"0" lucid nocompile atload"_zsh_autosuggest_start"
          zinit light ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions

          zinit ice wait"0" lucid nocompile
          zinit light ${pkgs.zsh-vi-mode}/share/zsh-vi-mode

          fpath=(''${fpath:#*zinit/completions})

          zinit ice wait"0" lucid nocompile atinit"zicompinit -C -d $ZSH_CACHE_DIR/.zcompdump; zicdreplay"
          zinit light ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting


          zinit ice wait"0" lucid nocompile atload""
          zinit ice compile'**/*.zsh'


          # END_TIME=$EPOCHREALTIME
          # STARTUP_DURATION=$(( (END_TIME - START_TIME) * 1000 ))
          # printf " launch time: %.2f мс\n" $STARTUP_DURATION
        '';
      };
    };

  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.zsh = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        imports = [ self.modules.homeManager.zsh ];
      };
    };

}
