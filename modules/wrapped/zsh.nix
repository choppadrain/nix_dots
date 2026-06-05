{ inputs,self, ... }:
{
  flake.modules.home.zsh =
    {
      wlib,
      lib,
      pkgs,
      config,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.zsh ];
      config = {
        zshrc.content = ''
          zmodload zsh/datetime
          START_TIME=$EPOCHREALTIME
          source ${pkgs.zinit}/share/zinit/zinit.zsh
          source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
          source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
          source ${pkgs.zinit}/share/zinit

            
            #plugins=(git zsh-autosuggestions zsh-fast-syntax-highlighting)

            
            HISTFILE=~/.zsh_history
            HISTSIZE=10000
            SAVEHIST=10000





             if [[ ! -f ${ZDOTDIR:-$HOME}/.zshrc.zwc || ~/.zshrc -nt ${ZDOTDIR:-$HOME}/.zshrc.zwc ]]; then
             zcompile -R ${ZDOTDIR:-$HOME}/.zshrc.zwc ~/.zshrc 2>/dev/null
             fi

            eval "$(zoxide init zsh)"
            eval "$(starship init zsh)"
            END_TIME=$EPOCHREALTIME
  
            STARTUP_DURATION=$(( (END_TIME - START_TIME) * 1000 ))
            printf " launch time: %.2f мс\n" $STARTUP_DURATION
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
            imports = [self.modules.home.zsh];
        };
    };

}
