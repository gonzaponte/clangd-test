{ self
, nixpkgs # <---- This `nixpkgs` has systems removed e.g. legacyPackages.zlib
, ...
}: let
  pkgs = nixpkgs.legacyPackages;
  clang = pkgs.llvmPackages_16.clang;
  in {

    packages.default = self.packages.helloworld;

    packages.helloworld = pkgs.stdenv.mkDerivation {
      pname = "helloworld";
      version = "0.0.0";
      src = "${self}/src";
      nativeBuildInputs = [];
      buildInputs = [];
    };

    devShell = self.devShells.clang;

    devShells.clang = pkgs.mkShell.override { stdenv = clang.stdenv; } ({
      name = "helloworld-shell";
      packages = with pkgs; [ just clang-tools meson ninja clang ];
    });
  }
