{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }: let
    inherit (nixpkgs) lib;
    systems = lib.systems.flakeExposed;
    pkgsFor = lib.genAttrs systems (
      system: import nixpkgs {inherit system;}
    );
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
  in {
    packages = forEachSystem (pkgs: rec {
      default = emacs;
      emacs = pkgs.callPackage ./package.nix { };
    });
  };
}
