{pkgs, ...}: {
  home.packages = with pkgs; [
    fzf
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
}
