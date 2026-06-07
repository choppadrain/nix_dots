{ inputs, ... }:
let
  username = "choppadrain";
in
{
  flake.modules.nixos."${username}" =
    { pkgs, lib, ... }:
    {
      users.users."${username}" = {
        isNormalUser = true;
        shell = inputs.self.packages.${pkgs.system}.zsh;
        # shell = pkgs.nushell;
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
          "audio"
          "tty"
          "kvm"
          "libvirtd"
        ];

        initialPassword = "changeme420";

      };
      home-manager.users."${username}" = {
        home.username = "${username}";
        home.homeDirectory = lib.mkDefault "home/${username}";
      };
    };
}
