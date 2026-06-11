{self,inputs,pkgs,...}:{
    flake.modules.nixos.desktop = let 
         pkgs-hypr-old = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in{
        hardware.graphics.package = pkgs-hypr-old.mesa;
        home-manager.sharedModules = [
            self.modules.homeManager.hyprland
        ];

    };

    flake.modules.homeManager.hyprland = { ...}:{
        programs.hyprland = let 
            pkgs.hypr = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}; 
        in
        {
            enable = true;
            package =pkgs.hypr.hyprland;
            portalPackage = pkgs.hypr.xdg-desktop-portal-hyprland;
            plugins = [];
        };
        
    };
}
