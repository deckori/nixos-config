{
  self,
  username,
  ...
}:
{
  flake.nixosModules.laptopUser =
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

            self.homeModules.guiMisc
          ];
        };
      };
    };
}
