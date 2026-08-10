{
  self,
  username,
  ...
}:
{
  flake.nixosModules.laptopUser =
    { pkgs, ... }:
    {
      users.users.${username} = {
        isNormalUser = true;
        group = username;
        description = "${username}";
        extraGroups = [
          "networkmanager"
          "kvm"
          "wheel"
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

            self.homeModules.niri
            self.homeModules.laptopHome
            self.homeModules.btop
            self.homeModules.git
          ];
        };
      };
    };
}
