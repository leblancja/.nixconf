{
  description = "NixOS configurations";

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

    # nixosConfigurations.jl-nixos-desktop = nixpkgs.lib.nixosSystem {
    #   specialArgs = { inherit inputs; };
    #   system = "x86_64-linux";
    #   modules = [
		#     ./hosts/jl-nixos-desktop/default.nix
		#     ./nixosModules
	  #     home-manager.nixosModules.home-manager
	  #     {
	  #       home-manager.useGlobalPkgs = true;
	  #       home-manager.useUserPackages = true;
	  #       home-manager.users.jordanl = import ./hosts/jl-nixos-desktop/home.nix;
	  #     }
	      
    #   ];
    # };

    nixosConfigurations = {
      desktop-3070S = let 
        username = "jordanl";
        specialArgs = {inherit username;};
      in 
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./hosts/desktop-3070S
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}
