{
  description = "vanilla php devenv with caddy as webserver";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
          {
            devShells.default = pkgs.mkShell {
              buildInputs = with pkgs;
                [
                  git
                  php
                  caddy
                ];
            };
          }
    );
}
