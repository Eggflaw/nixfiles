{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };

    
  };

  outputs = { self, nixpkgs, home-manager ,... }@inputs:
    let
    inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # packages = forAllSystems (system: import ./pkgs {inherit nixpkgs;} );

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
      "eggflaw" = home-manager.lib.homeManagerConfiguration {
      	pkgs = pkgs;
        extraSpecialArgs = {inherit inputs outputs;};
	      modules = [
	        ./home/home.nix
	      ];
      };
	};
    };
}
