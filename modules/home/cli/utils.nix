{ ... }:
{
  flake.modules.nixos.utils =
    { pkgs, ... }:
    {

      environment.systemPackages = with pkgs; [
        fzf
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
