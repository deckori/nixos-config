{
  description = "deckori's nixos configuration";

  # nixConfig = {
  #   extra-substituters = [
  #     "https://nixos-raspberrypi.cachix.org"
  #   ];
  #   extra-trusted-public-keys = [
  #     "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
  #   ];
  #   connect-timeout = 5;
  # };

  inputs = {
    secrets = {
      url = "path:/st/remotes/secrets";
      flake = false;
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-raspberrypi = {
      url = "github:nvmd/nixos-raspberrypi/main";
    };

    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-custom = {
      url = "github:deckori/custom-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs = {
        hyprland = {
          follows = "hyprland";
        };
      };
    };

    waybar.url = "github:Alexays/Waybar";

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    adw-bluetooth = {
      url = "github:ezratweaver/adwaita-bluetooth";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    yazi.url = "github:sxyazi/yazi/nightly";
  };

  outputs =
    {
      nix-on-droid,
      nixos-anywhere,
      nixos-raspberrypi,
      nixpkgs,
      nixpkgs-custom,
      nixpkgs-unstable,
      self,
      yazi,
      ...
    }@inputs:
    let
      username = "REDACTED";
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-32 = import nixpkgs {
        system = "i686-linux";
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-custom = nixpkgs-custom.packages.${system};
      lib = nixpkgs.lib;

      # The below setup is my attempted setup for custom packages
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs system;

      # The below setup is my attempted setup for raspberry pi 5
      allSystems = nixpkgs.lib.systems.flakeExposed;
      forSystems = systems: f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      devShells = forSystems allSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [
              nil # lsp language server for nix
              nixpkgs-fmt
              nix-output-monitor
              nixos-anywhere.packages.${system}.default
            ];
          };
        }
      );

      installerImages = nixos-raspberrypi.installerImages.rpi5;

      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            inputs.sops-nix.nixosModules.sops
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.default
            ./hosts/laptop
            ./overlays
          ];
          specialArgs = {
            host = "laptop";
            inherit
              self
              pkgs-32
              pkgs-custom
              pkgs-unstable
              inputs
              username
              yazi
              ;
          };
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            inputs.sops-nix.nixosModules.sops
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.default
            ./hosts/vm
            ./overlays
          ];
          specialArgs = {
            host = "vm";
            inherit
              self
              pkgs-unstable
              inputs
              username
              ;
          };
        };
      };
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };

        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/nix-on-droid
        ];

        specialArgs = {
          host = "vm";
          inherit
            self
            pkgs-unstable
            inputs
            username
            ;
        };

        extraSpecialArgs = {
          username = "nix-on-droid";
        };
      };
      rpi5 = nixos-raspberrypi.lib.nixosSystemFull {
        specialArgs = inputs;
        modules = [
          ./hosts/rpi5-2
        ];
      };
    };
}
