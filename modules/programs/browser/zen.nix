{ self, ... }:
{
  flake.nixosModules.zen-browser = {
    home-manager.sharedModules = [
      self.homeModules.zen-browser
    ];
  };
  flake.homeModules.zen-browser =
    { inputs, pkgs, ... }:
    {
      imports = [ inputs.zen-browser.homeModules.twilight ];
      programs.zen-browser = {
        enable = true;
        nativeMessagingHosts = [ pkgs.firefoxpwa ];
      };
    };
}
