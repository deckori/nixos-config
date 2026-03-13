{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./boot-loader.nix
    ./hardware-configuration.nix
    ./pi5-configtxt.nix
    ./common-user-config

    # WARNING: formatting disk with disko is DESTRUCTIVE, check if
    # `disko.devices.disk.nvme0.device` is set correctly!
    # ./disko-usb-btrfs.nix
    ./disko.nix

    ./remote-builder.nix

    # ../../modules/core
    ./user.nix
    ../../modules/core/foundation/package-manager
    ../../modules/core/services
    ../../modules/core/secrets
    ../../modules/shared-modules.nix
    ../../modules/core/secrets
    ../../modules/core/cli
  ];

  services.photoprism.enable = true;
  services.jellyfin.enable = true;
  services.suwayomi-server.enable = true;

  services.gitolite = {
    enable = true;
    adminPubkey = (
      lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/.ssh/rpi5-hosted-gitolite.pub")
    );
  };
  services.taskchampion-sync-server = {
    enable = true;
    host = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/rpi5"));
  };
  services.matrix-conduit = {
    enable = true;
    settings.global.address = (
      lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/rpi5")
    );
  };
  services.mautrix-whatsapp.enable = true;

  programs.gnupg.agent = {
    pinentryPackage = pkgs.pinentry-tty;
  };

  environment.systemPackages = with pkgs; [
    btop
  ];
}
