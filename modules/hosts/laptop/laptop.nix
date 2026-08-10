{
  inputs,
  self,
  username,
  ...
}:

{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self username;
    };
    modules = [
      self.nixosModules.shared
      self.nixosModules.overlays
      self.nixosModules.audio
      self.nixosModules.network
      self.nixosModules.bluetooth
      self.nixosModules.hardware
      self.nixosModules.power
      self.nixosModules.fonts
      self.nixosModules.bootLoader
      self.nixosModules.secureBoot
      self.nixosModules.security
      self.nixosModules.nvidiaIntelHybridGpu
      self.nixosModules.stylix
      self.nixosModules.customColorOptions

      self.nixosModules.homeManager
      self.nixosModules.laptopUser

      self.nixosModules.nix
      self.nixosModules.lix

      ## Package config
      self.nixosModules.shell
      self.nixosModules.cliMisc
      self.nixosModules.git
      self.nixosModules.ssh
      self.nixosModules.gaming

      self.nixosModules.niri
      self.nixosModules.noctalia
      self.nixosModules.noctalia-greeter

      # Laptop specific configuration merged from old hosts/laptop/default.nix
      (
        {
          pkgs,
          config,
          lib,
          modulesPath,
          ...
        }:
        {
          system.stateVersion = "26.05";
          services.flatpak.enable = true;

          services.openssh.enable = true;
          programs.ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
          programs.gnupg.agent = {
            pinentryPackage = pkgs.pinentry-gnome3;
          };
          networking.hostName = "laptop";
          qt.enable = true;

          services.xserver.enable = true;
          xdg.portal.enable = true;

          programs.niri.enable = true;
          # programs.hyprland.enable = false;

          # services.displayManager.sddm.enable = true;
          # services.desktopManager.plasma6.enable = true;

          services.printing.enable = true;

          # Custom module options (Assuming these are defined in modules/core)
          # consuetudo.nvidia-intel.enable = true;
          # consuetudo.power.enable = true;
          # consuetudo.gaming-config.enable = true;
          # consuetudo.btop-cuda.enable = true;
          # consuetudo.winApps.enable = true;

          virtualisation.libvirtd.enable = true;
          services.avahi.enable = true;
          services.suwayomi-server.enable = true;

          services.taskchampion-sync-server = {
            enable = true;
            host = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
          };
          virtualisation.docker.enable = true;
          services.qbittorrent.enable = true;
          services.scanservjs.enable = true;
          services.tor.enable = true;
          services.magic-wormhole-mailbox-server.enable = true;

          services.gitolite = {
            enable = true;
            adminPubkey = (
              lib.strings.removeSuffix "\n" (
                builtins.readFile "${inputs.secrets}/.ssh/laptop-hosted-gitolite.pub"
              )
            );
          };

          programs.ladybird.enable = true;
          programs.kdeconnect.enable = true;
          programs.zoom-us.enable = true;

          programs.appimage = {
            enable = true;
            binfmt = true;
          };

          environment.systemPackages = with pkgs; [
            pulseaudioFull
            miraclecast
            magic-wormhole
            linux-wifi-hotspot
            gitolite
            baobab
            proton-vpn-cli
            digikam
            wl-clipboard
            pinentry-gnome3
            borgbackup
            refind
            _7zz-rar
            fd
            ueberzugpp
            nushell
            beeper
          ];

          hardware.alsa.enablePersistence = true;

          services.printing = {
            drivers = with pkgs; [
              brlaser
              brgenml1lpr
              brgenml1cupswrapper
            ];
          };

          imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
          ];

          boot.initrd.availableKernelModules = [
            "xhci_pci"
            "ahci"
            "nvme"
            "usbhid"
            "uas"
            "usb_storage"
            "sd_mod"
          ];

          boot.initrd.kernelModules = [ ];
          boot.kernelModules = [ "kvm-intel" ];
          boot.extraModulePackages = [ ];

          boot.initrd.luks.devices."nixos-root".device =
            "/dev/disk/by-uuid/3e6d255d-3e55-4448-ad41-95e293cfff3d";

          fileSystems."/" = {
            device = "/dev/mapper/nixos-root";
            fsType = "btrfs";
            options = [ "subvol=@" ];
          };

          fileSystems."/boot" = {
            device = "/dev/disk/by-label/NIXOS-ROOT";
            fsType = "vfat";
            options = [
              "fmask=0077"
              "dmask=0077"
            ];
          };

          boot.initrd.luks.devices."kingston".device =
            "/dev/disk/by-uuid/00ddcc85-31c4-4b18-b478-d4b06790c333";

          fileSystems."/home" = {
            device = "/dev/mapper/kingston";
            fsType = "btrfs";
            options = [ "subvol=home" ];
          };

          fileSystems."/st" = {
            device = "/dev/mapper/kingston";
            fsType = "btrfs";
            options = [ "subvol=st" ];
          };

          boot.initrd.luks.devices."swap".device = "/dev/disk/by-uuid/d93797fe-adbb-47a2-beeb-5ddc34e1673a";

          boot.resumeDevice = "/dev/mapper/swap";

          swapDevices = [
            { device = "/dev/mapper/swap"; }
          ];

          nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
          hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        }
      )
    ];
  };
}
