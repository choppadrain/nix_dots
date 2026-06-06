{...}:{
    flake.modules.nixos.sway = {lib,...}:{
        nixpkgs.overlays = [
  (final: prev: {
    sway-unwrapped = prev.sway-unwrapped.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        (final.fetchpatch {
          url = "https://github.com/swaywm/sway/pull/4255.patch";
          # hash = lib.fakeHash;  # let it fail once, then paste the correct hash
           hash = "sha256-/LhiO1M/7i/6khRJZehWVPAXqH/jCUanetQzb34HMRM=";
        })
      ];
    });
  })
];
    };
}
