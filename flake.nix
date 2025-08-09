{
  description = "Development shell with conditional dependencies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      buildInputs = [
        pkgs.pnpm_9
        pkgs.nodejs_20
      ];
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = buildInputs;
        shellHook = ''
            pnpm install
            pnpm run gulp install
        '';
      };
    };
}


