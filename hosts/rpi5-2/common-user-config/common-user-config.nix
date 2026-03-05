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
