{ ... }:
{
  flake.modules.nixos.utils =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        fzf
        eza
        bat
        ripgrep
        fd
        awww
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
}
