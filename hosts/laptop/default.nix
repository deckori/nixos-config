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

  services.logind.settings.Login.HandleLidSwitch = "ignore";

  consuetudo.wm.enable = true;
  consuetudo.gui.enable = true;
  consuetudo.btop-cuda.enable = true;

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
  services.nextcloud.enable = true;
  services.taskchampion-sync-server.enable = true;
  virtualisation.docker.enable = true;
  consuetudo.programs.gitolite.enable = true;
  services.qbittorrent.enable = true;
  services.scanservjs.enable = true;

  consuetudo.hyprlock.enable = true;

  home-manager.users.${username} = {
    consuetudo = {
      wm.enable = true;
      programs.niri.enable = true;
    };

    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
    home.stateVersion = "25.11";
  };

  system.stateVersion = "25.11";
}
