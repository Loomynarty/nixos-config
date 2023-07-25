{
  description = "nixos-config";

  inputs = {
    # Nixpkgs Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      p52s = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        modules = [ 
          ./machines/p52s
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.loomy = import ./home/loomy.nix; 
            };      
          } 
        ];
        specialArgs = { inherit inputs; };
      };  
    };
  };
}