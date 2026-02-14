{
  pkgs,
  config,
  host,
  lib,
  username,
  ...
}:
{
  imports = [
    ./fixes.nix
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/core/default.laptop.nix
  ];

  consuetudo = {
    # gpu.name = "hybrid-intel-nvidia";
    wm.enable = true;
    services.enable = true;
    btop-cuda.enable = true;
  };

  home-manager.users.${username} = {
    consuetudo = {
      wm.enable = true;
      programs.niri.enable = true;
    };

    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
  };

  programs.niri.enable = true;
  programs.hyprland.enable = false;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.ssh.askPassword = lib.mkForce "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";

  networking.hostName = "${host}";
  services.openssh.enable = true;
}
