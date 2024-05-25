{
  description = "Nixos config flake";

  nixConfig = {
    extra-substituters = [
      "https://eggflaw-nur.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "eggflaw-nur.cachix.org-1:bQl+ZeD9iuaaR9DpHdUUHtOwoTAdnGCjNLbDUnwtGjs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nur,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in { 
    nixosSystemModules = import ./modules/system;

    homeModules = import ./modules/home;

    overlays = import ./overlays {inherit inputs;};

    # NixOs configuration
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    # Home manager configuration
    homeConfigurations = {
      eggflaw = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/home.nix
          nur.hmModules.nur
        ];
      };
    };
  };
}
