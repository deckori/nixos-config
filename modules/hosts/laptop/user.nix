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
          home.stateVersion = "26.05";
          home.username = "${username}";
          imports = [
            self.homeModules.username

            self.homeModules.niri

            self.homeModules.laptopHome

            self.homeModules.cliMisc
            self.homeModules.btop
            self.homeModules.git
            self.homeModules.zoxide
            self.homeModules.neovim
            self.homeModules.tmux
            self.homeModules.nushell
            self.homeModules.yazi

            self.homeModules.guiMisc
          ];
        };
      };
    };
}
