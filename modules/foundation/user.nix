{
  self,
  username,
  ...
}:
{
  flake.nixosModules.user =
    { pkgs, ... }:
    {
      nix.settings.trusted-users = [ username ];

      # For media file services
      users.groups.media = { };

      users.users.${username} = {
        isNormalUser = true;
        group = username;
        description = "${username}";
        extraGroups = [
          "networkmanager"
          "kvm"
          "wheel"
          "media"
        ];
        shell = pkgs.bash;
      };

      users.groups.${username} = { };

      home-manager = {
        users.${username} = {
          home.stateVersion = "26.05";
          home.username = "${username}";
          imports = [
            self.homeModules.username

            self.homeModules.btop
            self.homeModules.git
            self.homeModules.zoxide
            self.homeModules.tmux
            self.homeModules.nushell
            self.homeModules.yazi

            self.homeModules.activitywatch
          ];
        };
      };
    };
}
