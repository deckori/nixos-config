{
  pkgs,
  host,
  lib,
  username,
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

  qt = {
    enable = true;
  };

  stylix.targets.qt.enable = true;

  services.logind.settings.Login.HandleLidSwitch = "ignore";

  programs.niri.enable = true;
  programs.hyprland.enable = false;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";

  services.printing.enable = true;
  consuetudo.nvidia-intel.enable = true;
  consuetudo.power.enable = true;

  networking.hostName = "${host}";
  services.openssh.enable = true;

  virtualisation.libvirtd.enable = true;
  services.avahi.enable = true;
  services.odoo.enable = false;
  services.davfs2.enable = false;
  services.gotenberg.enable = false;
  services.suwayomi-server.enable = true;
  services.nextcloud = {
    enable = true;
    hostName = "laptop";
  };
  services.taskchampion-sync-server.enable = true;
  virtualisation.docker.enable = true;
  consuetudo.programs.gitolite.enable = true;
  services.qbittorrent.enable = true;
  services.scanservjs.enable = true;

  # NOTE: Be sure to check whether the following lock screen is enabled (in home-manager typically)
  # security.pam.services.hyprlock = { };

  # Packages
  programs.ladybird.enable = true;
  programs.kdeconnect.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  environment.systemPackages = with pkgs; [
    miraclecast
    linux-wifi-hotspot
    baobab
    protonvpn-gui
  ];
}
