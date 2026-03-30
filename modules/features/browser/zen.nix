{ self, inputs, ... }:
{
  flake.nixosModules.zenBrowser = {
    home-manager.sharedModules = [
      inputs.zen-browser.homeModules.twilight
      self.homeModules.zenBrowser
    ];
  };
  flake.homeModules.zenBrowser =
    { inputs, pkgs, ... }:
    {
      programs.zen-browser = {
        enable = true;
        nativeMessagingHosts = [ pkgs.firefoxpwa ];
      };
    };
}
