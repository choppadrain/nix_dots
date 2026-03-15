{ inputs, self, ... }:
let
  username = "choppadrain";
in
{
  flake.nixosModules."${username}" =
    { pkgs, lib, ... }:
    {
      imports = with self.nixosModules; [
        grub
      ];
      users.users."${username}" = {
        isNormalUser = true;
        shell = pkgs.nushell;
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
          "audio"
          "tty"
        ];

        initialPassword = "changeme420";

      };
      home-manager.users."${username}" = {
        home.username = "${username}";
        home.homeDirectory = lib.mkDefault "home/${username}";
      };
    };
}
