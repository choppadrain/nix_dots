{pkgs, ...}: {
  home.packages = with pkgs; [
    gamemode
    lutris
    steam
    gamescope
    protontricks
    #   winetricks
    wineWowPackages.full
    #lutris
    protonup-ng
    prismlauncher
  ];
}
