{
  description = "deckori's nixos configuration";

  nixConfig = {
    # bash-prompt = "\[nixos-raspberrypi-demo\] ➜ ";
    # extra-substituters = [
    #   "https://nixos-raspberrypi.cachix.org"
    # ];
    # extra-trusted-public-keys = [
    #   "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    # ];
    # connect-timeout = 5;
  };

  inputs = {
    # deck-repos is a custom Host definition i made in $HOME/.ssh/config. Create the definition before you use this flake
    secrets = {
      url = "git+ssh://deck-repos:/secrets.git";
      flake = false;
    };

    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      # url = "github:nix-community/home-manager/release-25.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      # url = "github:danth/stylix/release-25.11";
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-raspberrypi = {
      url = "github:nvmd/nixos-raspberrypi/main";
    };

    nixos-anywhere = {
      url = "github:nix-community/nixos-anywhere";
    };

    nixpkgs-custom = {
      url = "github:deckori/custom-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
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

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      nixpkgs-stable,
      nixpkgs-unstable,
      self,
      yazi,
      ...
    }@inputs:
    let
      username = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/users/main"));
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
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

      users-config-stub = (
        {
          config,
          lib,
          username,
          ...
        }:
        {
          # This is identical to what nixos installer does in
          # (modulesPash + "profiles/installation-device.nix")

          users.users.${username} = {
            isNormalUser = true;
            extraGroups = [
              "wheel"
              "networkmanager"
              "video"
            ];
            initialPassword = (
              lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/passwords/users/main-user")
            );
            openssh.authorizedKeys.keys = [
              (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/.ssh/rpi5-main-user.pub"))
            ];
          };

          # Use less privileged nixos user
          users.users.nixos = {
            isNormalUser = true;
            extraGroups = [
              "wheel"
              "networkmanager"
              "video"
            ];
            # Allow the graphical user to login without password
            # initialHashedPassword = "";
          };

          # Allow the user to log in as root without a password.
          users.users.root.initialHashedPassword = "";

          # Don't require sudo/root to `reboot` or `poweroff`.
          security.polkit.enable = true;

          # Allow passwordless sudo from nixos user
          security.sudo = {
            enable = true;
            wheelNeedsPassword = true;
          };

          # Automatically log in at the virtual consoles.
          services.getty.autologinUser = "nixos";

          services.tailscale.enable = true;

          # We run sshd by default. Login is only possible after adding a
          # password via "passwd" or by adding a ssh key to ~/.ssh/authorized_keys.
          # The latter one is particular useful if keys are manually added to
          # installation device for head-less systems i.e. arm boards by manually
          # mounting the storage in a different system.
          services.openssh = {
            enable = true;
            settings.PermitRootLogin = "no";
          };

          # allow nix-copy to live system
          nix.settings.trusted-users = [ "nixos" ];

          # We are stateless, so just default to latest.
          system.stateVersion = config.system.nixos.release;
        }
      );

      network-config = {
        # This is mostly portions of safe network configuration defaults that
        # nixos-images and srvos provide

        networking.useNetworkd = true;
        # mdns
        networking.firewall.allowedUDPPorts = [ 5353 ];
        systemd.network.networks = {
          "99-ethernet-default-dhcp".networkConfig.MulticastDNS = "yes";
          "99-wireless-client-dhcp".networkConfig.MulticastDNS = "yes";
        };

        # This comment was lifted from `srvos`
        # Do not take down the network for too long when upgrading,
        # This also prevents failures of services that are restarted instead of stopped.
        # It will use `systemctl restart` rather than stopping it with `systemctl stop`
        # followed by a delayed `systemctl start`.
        systemd.services = {
          systemd-networkd.stopIfChanged = false;
          # Services that are only restarted might be not able to resolve when resolved is stopped before
          systemd-resolved.stopIfChanged = false;
        };

        # Use iwd instead of wpa_supplicant. It has a user friendly CLI
        networking.wireless.enable = false;
        networking.wireless.iwd = {
          enable = true;
          settings = {
            Network = {
              EnableIPv6 = true;
              RoutePriorityOffset = 300;
            };
            Settings.AutoConnect = true;
          };
        };
      };

      common-user-config =
        { config, pkgs, ... }:
        {
          imports = [
            ./hosts/rpi5-2/modules/nice-looking-console.nix
            users-config-stub
            network-config
          ];

          time.timeZone = "UTC";
          networking.hostName = "rpi${config.boot.loader.raspberry-pi.variant}-demo";

          services.udev.extraRules = ''
            # Ignore partitions with "Required Partition" GPT partition attribute
            # On our RPis this is firmware (/boot/firmware) partition
            ENV{ID_PART_ENTRY_SCHEME}=="gpt", \
              ENV{ID_PART_ENTRY_FLAGS}=="0x1", \
              ENV{UDISKS_IGNORE}="1"
          '';

          environment.systemPackages = with pkgs; [
            nushell
            tree
          ];

          system.nixos.tags =
            let
              cfg = config.boot.loader.raspberry-pi;
            in
            [
              "raspberry-pi-${cfg.variant}"
              cfg.bootloader
              config.boot.kernelPackages.kernel.version
            ];
        };

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
            inputs.lanzaboote.nixosModules.lanzaboote
            ./hosts/laptop
            ./modules/shared-modules.nix
            ./overlays
          ];
          specialArgs = {
            host = "laptop";
            inherit
              self
              pkgs-32
              pkgs-custom
              pkgs-unstable
              pkgs-stable
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
        rpi5 = nixos-raspberrypi.lib.nixosSystemFull {
          specialArgs = inputs;
          modules = [
            (
              {
                config,
                pkgs,
                lib,
                nixos-raspberrypi,
                disko,
                ...
              }:
              {
                imports = with nixos-raspberrypi.nixosModules; [
                  # Hardware configuration
                  raspberry-pi-5.base
                  raspberry-pi-5.page-size-16k
                  raspberry-pi-5.display-vc4
                  ./hosts/rpi5-2/pi5-configtxt.nix
                ];
              }
            )
            # Disk configuration
            inputs.disko.nixosModules.disko
            # WARNING: formatting disk with disko is DESTRUCTIVE, check if
            # `disko.devices.disk.nvme0.device` is set correctly!
            # ./disko-usb-btrfs.nix
            ./hosts/rpi5-2/disko.nix
            # Further user configuration
            common-user-config
            {
              boot.tmp.useTmpfs = true;
            }

            # Advanced: Use non-default kernel from kernel-firmware bundle
            (
              {
                config,
                pkgs,
                lib,
                ...
              }:
              let
                kernelBundle = pkgs.linuxAndFirmware.v6_6_31;
              in
              {
                boot = {
                  loader.raspberry-pi.firmwarePackage = kernelBundle.raspberrypifw;
                  loader.raspberry-pi.bootloader = "kernel";
                  kernelPackages = kernelBundle.linuxPackages_rpi5;
                };

                nixpkgs.overlays = lib.mkAfter [
                  (self: super: {
                    # This is used in (modulesPath + "/hardware/all-firmware.nix") when at least
                    # enableRedistributableFirmware is enabled
                    # I know no easier way to override this package
                    inherit (kernelBundle) raspberrypiWirelessFirmware;
                    # Some derivations want to use it as an input,
                    # e.g. raspberrypi-dtbs, omxplayer, sd-image-* modules
                    inherit (kernelBundle) raspberrypifw;
                  })
                ];
              }
            )

          ];
        };

      };
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-linux";
          config.allowUnfree = true;
        };

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
    };
}
