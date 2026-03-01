#default.nix
{
  inputs,
  self,
  ...
}: {
    flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
	modules = [
	self.nixosModules.nixosModule
	self.nixosModules.desktop
	self.nixosModules.amdgpu
	self.nixosModules.base
	self.nixosModules.home-manager
	];
  };
   flake.nixosModules.nixosModule = { pkgs, ... }: {
  programs.git.enable = true;
  imports = [
  	];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  environment.variables = {
  EDITOR = "nvim";
  VISUAL = "nvim";
};

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Chisinau";

  i18n.defaultLocale = "en_US.UTF-8";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    waybar
    libnotify
    firefox
    fastfetch
    swaynotificationcenter
    wl-clipboard
    grim
    slurp
    os-prober
    telegram-desktop
    vesktop
    ntfs3g
    kdePackages.qt6ct
    kdePackages.dolphin
    libgbm
    fnm
    libreoffice
    hyprpolkitagent
    mesa
    gcc
    cargo
    self.packages.${system}.neovim
  ];
    nix.settings.experimental-features = [
	"nix-command"
	"flakes"
    ];


  system.stateVersion = "25.05"; # Did you read the comment?
    };
}
