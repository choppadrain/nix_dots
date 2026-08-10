{ ... }: {
  flake.modules.nixos.desktop = { ... }: {
    home-manager.sharedModules = [

    ];
  };
  flake.modules.homeManager.gtk = { ... }: {
    programs.gtk = {
      enable = true;

    };
  };
}
