{
  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      sops-nix,
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
            nixos-hardware.nixosModules.raspberry-pi-4
            sops-nix.nixosModules.sops
            ./hosts/corvus/configuration.nix
            ./modules/beszel
          ];
        };
      };
    };
}
