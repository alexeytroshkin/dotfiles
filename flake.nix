{
  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      ...
    }:
    {
      nixosConfigurations = {
        hydra = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ];
        };
        andromeda = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ];
        };
        corvus = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/corvus/configuration.nix
            nixos-hardware.nixosModules.raspberry-pi-4
          ];
        };
      };
    };
}
