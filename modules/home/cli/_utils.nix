{ pkgs, ... }:
let
  cliUtils = { ... }: {

    environment.systemPackages = with pkgs; [
      fzf
      eza
      bat
      ripgrep
      fd
      p7zip-rar
      ncdu
      iftop
      btop
      fastfetch
      zoxide
      unzip

      mpv
      ffmpeg
      jq
      resvg
      poppler
    ];
  };
in
{
  osama.modules.core = { pkgs, ... }: {
    imports = [ cliUtils ];
  };
}
