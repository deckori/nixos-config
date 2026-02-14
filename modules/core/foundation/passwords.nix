{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  environment.systemPackages = with pkgs; [ libsecret ];
  # services.ssh-agent.enable = true;
}
