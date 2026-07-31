{ ... }:
let
  cliUtils = { pkgs, ... }: {

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
  flake.modules.nixos.base = { pkgs, ... }: {
    imports = [ cliUtils ];
  };
  flake.modules.darwin.base = { pkgs, ... }: {
    imports = [ cliUtils ];
  };
}
