{
  self,
  config,
  ...
}:
let
  username = config.consuetudo.mainUsername;
in
{
  flake.nixosModules.laptopUser =
    { pkgs, ... }:
    {
      users.users.${username} = {
        isNormalUser = true;
        group = username;
        # doesnt work for some reason
        # hashedPasswordFile = config.sops.secrets.my-password.path;
        description = "${username}";
        extraGroups = [
          "networkmanager"
          "kvm"
          "wheel"
          # "input" # temporarily for show-key nocatalia plugin
        ];
        shell = pkgs.bash;
      };

      users.groups.${username} = { };

      home-manager = {
        users.${username} = {
          home.stateVersion = "26.05";
          home.username = "${username}";
          imports = [
            self.homeModules.btop
          ];
        };
      };
    };
}
