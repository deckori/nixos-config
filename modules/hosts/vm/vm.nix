{
  inputs,
  self,
  username,
  ...
}:

{
  flake.nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self username;
    };
    modules = [
      self.nixosModules.shared
      self.nixosModules.nix
      self.nixosModules.lix

      # VM specific
      (
        {
          lib,
          pkgs,
          modulesPath,
          ...
        }:
        {
          imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

          # kvm/qemu doesn't use UEFI firmware mode by default.
          # so we force-override the setting here
          # and configure GRUB instead.
          boot.loader.systemd-boot.enable = lib.mkForce false;
          boot.loader.grub.enable = true;
          boot.loader.grub.device = "/dev/vda";
          boot.loader.grub.useOSProber = false;

          boot.initrd.availableKernelModules = [
            "ahci"
            "xhci_pci"
            "virtio_pci"
            "sr_mod"
            "virtio_blk"
          ];
          boot.initrd.kernelModules = [ ];
          boot.kernelModules = [ "kvm-intel" ];
          boot.extraModulePackages = [ ];

          fileSystems."/" = {
            device = "/dev/disk/by-uuid/631775ef-6851-4fe7-997f-189372f87437";
            fsType = "ext4";
          };

          swapDevices = [ ];

          networking.useDHCP = lib.mkDefault true;
          nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
          
          system.stateVersion = "26.05";
        }
      )
    ];
  };
}
