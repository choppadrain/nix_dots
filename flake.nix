{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    base16.url = "github:SenchoPens/base16.nix";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    otter-launcher = {
      url = "github:kuokuo123/otter-launcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
        url = "github:hyprwm/Hyprland";
    };

    niri = {
      url = "github:sodiboo/niri-flake/849983db4074cdd35f0b9afe71b799d8a049e727";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#yazi stuff
    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    relative-motions = {
      url = "github:dedukun/relative-motions.yazi/d4f2003b90a6129847e17107df76ba43091c7755";
      flake = false;
    };

    fuzzy-search = {
      url = "github:onelocked/fuzzy-search.yazi";
      flake = false;
    };
#=======================
    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
