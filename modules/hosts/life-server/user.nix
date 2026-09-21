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
          imports = [
          ];
        };
      };
    };
}
