{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    base16.url = "github:SenchoPens/base16.nix";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    #proprietary apple
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #non-proprietary apple
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1&ref=v0.55.4";
    };

    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.55.0";
      inputs.hyprland.follows = "hyprland";
    };

    #=======yazi stuff======
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
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
