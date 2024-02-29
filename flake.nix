{
  description = "Hello World!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nosys  .url = "github:divnix/nosys";
  };

  outputs = inputs @ {
    nosys,
    nixpkgs, # <---- This `nixpkgs` still has the `system` e.g. legacyPackages.${system}.zlib
    ...
  }: let outputs = import ./flake/outputs.nix;
         systems = [ "x86_64-linux" ];
    in nosys (inputs // { inherit systems; }) outputs;

}
