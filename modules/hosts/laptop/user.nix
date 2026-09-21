{
  self,
  username,
  ...
}:
{
  flake.nixosModules.laptopUser =
    { pkgs, ... }:
    {
      home-manager = {
        users.${username} = {
          imports = [
            self.homeModules.niri
            self.homeModules.laptopHome

            self.homeModules.cliMisc
            self.homeModules.neovim

            self.homeModules.guiMisc
          ];
        };
      };
    };
}
