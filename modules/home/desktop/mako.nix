{ self, ... }:
{
  flake.modules.nixos.desktop = {

    home-manager.sharedModules = [
      self.modules.homeManager.mako
    ];
  };
  flake.modules.homeManager.mako = { scheme, ... }: {
    services.mako = {
      enable = true;
      settings = {
        background-color = "${scheme.base01}";
        border-color = "${scheme.base16}";
        font = "SFMono Semi Bold Nerd";
        icons = true;
        text-color = "${scheme.base04}";
        default-timeout = 3;
      };
    };
  };
}
