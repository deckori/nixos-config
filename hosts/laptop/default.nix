{
  pkgs,
  pkgs-32,
  host,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./fixes.nix
    ./hardware-configuration.nix
    ./user.nix
    ../../modules/core
  ];

  system.stateVersion = "25.11";
  services.flatpak.enable = true;

  boot.lanzaboote.enable = true;

  services.openssh.enable = true;
  programs.ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
  programs.gnupg.agent = {
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  networking.hostName = "${host}";
  qt = {
    enable = true;
  };

  services.xserver.enable = true;
  xdg.portal.enable = true;

  programs.niri.enable = true;
  programs.hyprland.enable = false;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;
  consuetudo.nvidia-intel.enable = true;
  consuetudo.power.enable = true;
  consuetudo.gaming-config.enable = true;
  consuetudo.btop-cuda.enable = true;

  virtualisation.libvirtd.enable = true;
  services.avahi.enable = true;
  services.odoo.enable = false;
  services.davfs2.enable = false;
  services.gotenberg.enable = false;
  services.suwayomi-server.enable = true;
  services.nextcloud = {
    enable = false;
    package = pkgs.nextcloud32;
  };
  services.taskchampion-sync-server = {
    enable = true;
    host = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));
  };
  virtualisation.docker.enable = true;
  services.photoprism.enable = false;
  services.jellyfin.enable = false;
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

  # NOTE: Be sure to check whether the following lock screen is enabled (in home-manager typically)
  # security.pam.services.hyprlock = { };

  # Packages
  programs.ladybird.enable = true;
  programs.kdeconnect.enable = true;
  programs.zoom-us.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.nix-ld = {
    enable = false;
    libraries = [
      pkgs-32.glibc
      pkgs.glib # libglib-2.0.so.0, libgthread-2.0.so.0
    ];
  };
  environment.systemPackages = with pkgs; [
    miraclecast
    magic-wormhole
    linux-wifi-hotspot
    gitolite
    baobab
    protonvpn-gui
    digikam
    wl-clipboard
    pinentry-gnome3
    borgbackup
    refind
    _7zz-rar
    fd
    ueberzugpp
    nushell
    bitwarden-cli
  ];
}
