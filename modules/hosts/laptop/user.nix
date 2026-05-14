{
  self,
  config,
  ...
}:

{
  flake.nixosModules.laptopUser =
    { pkgs, ... }:
    {
      users.users.${config.consuetudo.mainUsername} = {
        isNormalUser = true;
        # doesnt work for some reason
        # hashedPasswordFile = config.sops.secrets.my-password.path;
        description = "${config.consuetudo.mainUsername}";
        extraGroups = [
          "networkmanager"
          "kvm"
          "wheel"
          # "input" # temporarily for show-key nocatalia plugin
        ];
        shell = pkgs.bash;
      };

    };
  flake.nixosModules.laptopHomeManager =
    { ... }:
    {
      home-manager = {
        users.${config.consuetudo.mainUsername} = {
          home.stateVersion = "26.05";
          imports = [
            self.homeModules.btop
          ];
        };
      };
    };
}
