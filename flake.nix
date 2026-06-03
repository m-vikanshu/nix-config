{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {
      nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
	  inherit system;
	  specialArgs = {
	    inherit inputs;
	  };
	  modules = [
	    ./configuration.nix

	    ({ pkgs, ... }: {
	      environment.systemPackages = with pkgs; [
		neovim
	      ];
	      programs.neovim.enable = true;
	      programs.neovim.viAlias = true;
	      programs.neovim.vimAlias = true;
	    })
	  ];
	};
      };
      homeConfigurations = {
	vikanshu = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [ ./home.nix ];
	};
      };
    };
}
