{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default-linux";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell rec {
            nativeBuildInputs = [
              pkgs.dotnetCorePackages.dotnet_9.sdk
              pkgs.nil
            ];

            buildInputs = [
              pkgs.skia
              pkgs.fontconfig
              pkgs.xorg.libX11
              pkgs.xorg.libICE
              pkgs.xorg.libSM
            ];

            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
          };
        };
    };
}
