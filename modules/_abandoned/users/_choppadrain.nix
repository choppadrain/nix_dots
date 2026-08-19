#nixos leftover, not sure that im going back to linux soon
{ inputs, constants, ... }:
{
  flake.modules.nixos."${constants.username}" =
    { pkgs, ... }:
    {
      users.users."${constants.username}" = {
        isNormalUser = true;
        shell = inputs.self.packages.${pkgs.system}.zsh;
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
    };

  osama.mods."${constants.username}" = {
    hjem.users.${constants.username} = {
      user = "${constants.username}";
    };
  };
}
