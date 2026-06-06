{ inputs, self, ... }:
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
        zshrc.content =
          let

            compiledZinit = pkgs.runCommand "compiled-zinit" { buildInputs = [ pkgs.zsh ]; } ''
                mkdir -p $out/share/zinit
                cp -r ${pkgs.zinit}/share/zinit/* $out/share/zinit/
                chmod -R +w $out/share/zinit
                zsh -c 'for f in $out/share/zinit/*.zsh; do zcompile "$f"; done'
              '';
          in
          ''
        zmodload zsh/datetime
        START_TIME=$EPOCHREALTIME
        source ${compiledZinit}/share/zinit/zinit.zsh

        HISTFILE=~/.zsh_history
        HISTSIZE=10000
        SAVEHIST=10000

        export ZSH_CACHE_DIR=~/.cache/zsh
        mkdir -p $ZSH_CACHE_DIR

        zinit ice wait"!0" lucid atinit'eval "$(starship init zsh)"'
        zinit light zdharma-continuum/null

        zinit ice wait"0b" lucid atinit'eval "$(zoxide init zsh)"'
        zinit light zdharma-continuum/null

        zinit ice blockf as"completion"
        zinit light ${pkgs.nix-zsh-completions}/share/zsh/site-functions

        zinit ice wait"0" lucid nocompile atload"_zsh_autosuggest_start"
        zinit light ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions

        zinit ice wait"0" lucid nocompile atinit"zicompinit -C -d $ZSH_CACHE_DIR/.zcompdump; zicdreplay"
        zinit light ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting

        zinit ice wait"0" lucid nocompile atload""

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
        imports = [ self.modules.home.zsh ];
      };
    };

}
