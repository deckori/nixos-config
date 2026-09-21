{
  self,
  username,
  ...
}:
{
  flake.nixosModules.serverUser =
    { pkgs, ... }:
    {
      home-manager = {
        users.${username} = {
          home.stateVersion = "26.05";
          home.username = "${username}";
          imports = [
          ];
        };
      };
    };
}
