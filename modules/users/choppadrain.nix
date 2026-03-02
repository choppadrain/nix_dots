{inputs, ...}:{
flake.nixosModules.desktop = {pkgs, ...}: {
  users.users.choppadrain = {
    isNormalUser = true;
    description = "boss420";
    shell = pkgs.nushell;
    extraGroups = ["networkmanager" "wheel" "video" "audio" "tty"];

    initialPassword = "changeme420";
  };
 };
}
