{ self, inputs, ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      imports = [
        inputs.niri.nixosModules.niri
      ];
      home-manager.sharedModules = [
        self.modules.homeManager.niri
      ];

      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri.package = pkgs.niri-unstable;

      programs.niri.enable = true;

      #extra packages
      environment.systemPackages = with pkgs; [
        xwayland-satellite
        swaynotificationcenter
        gamescope
        cage
        grim
        slurp
        wl-clipboard
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        xdg-desktop-portal
        awww
        apple-cursor
        polkit_gnome
        wofi
        wl-clip-persist
        cliphist

      ];
    };
}
