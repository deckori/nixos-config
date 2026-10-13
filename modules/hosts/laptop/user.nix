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
            self.homeModules.laptopHome

            self.homeModules.cliMisc
            self.homeModules.shell
            self.homeModules.neovim

            self.homeModules.guiMisc
            self.homeModules.kitty
            self.homeModules.xournalpp

            self.homeModules.noctalia
          ];
        };
      };
    };
}
