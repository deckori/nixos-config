{ ... }:

{
  flake.nixosModules.security =
    { pkgs, ... }:

    {
      security.rtkit.enable = true;
      security.sudo.enable = true;

      services.gnome.gnome-keyring.enable = true;
      programs.seahorse.enable = true;

      environment.systemPackages = with pkgs; [ libsecret ];
      # services.ssh-agent.enable = true;
    };
}
