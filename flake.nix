{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {

    nixosConfigurations = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
		./hosts/jl-nixos-desktop/default.nix
		./nixosModules
	      	home-manager.nixosModules.home-manager
	      	{
	        	home-manager.useGlobalPkgs = true;
	        	home-manager.useUserPackages = true;
	        	home-manager.users.jordanl = import ./hosts/jl-nixos-desktop/home.nix;
	      	}
	      
      ];
    };
  };
}
