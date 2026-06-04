{ ... }:
{
  flake.modules.nixos.utils =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        fzf
        awww
        p7zip-rar
        ripgrep
        ncdu
        iftop
        btop
        fastfetch
        bat
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
