{
  inputs,
  self,
  username,
  ...
}:

{
  flake.nixosConfigurations.rpi5 = inputs.nixos-raspberrypi.lib.nixosSystem {
    specialArgs = {
      inherit inputs self username;
      nixos-raspberrypi = inputs.nixos-raspberrypi;
    };
    modules = [
      self.nixosModules.shared
      self.nixosModules.nix
      self.nixosModules.lix
      self.nixosModules.mainUsername
      inputs.disko.nixosModules.disko

      (
        {
          pkgs,
          lib,
          ...
        }:
        {
          imports = [
            # Hardware
            inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
            inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k
            inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4

            # Disk
            (import ../../../hosts/rpi5-2/disko.nix)
          ];

          boot.tmp.useTmpfs = true;

          services.photoprism.enable = true;
          services.jellyfin.enable = true;
          services.suwayomi-server.enable = true;

          services.gitolite = {
            enable = true;
            adminPubkey = (
              lib.strings.removeSuffix "\n" (
                builtins.readFile "${inputs.secrets}/.ssh/rpi5-hosted-gitolite.pub"
              )
            );
          };

          users.users.${username} = {
            isNormalUser = true;
            extraGroups = [
              "wheel"
              "networkmanager"
              "video"
            ];
            openssh.authorizedKeys.keys = [
              (lib.strings.removeSuffix "\n" (
                builtins.readFile "${inputs.secrets}/.ssh/rpi5-main-user.pub"
              ))
            ];
          };

          nixpkgs.hostPlatform = "aarch64-linux";
          system.stateVersion = "26.05";
        }
      )
    ];
  };
}
