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
    };
}
