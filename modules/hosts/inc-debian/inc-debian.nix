{
  inputs,
  self,
  pkgs-custom,
  pkgs-stable,
  username,
  laptop,
  ...
}:

{
  flake.systemConfigs.x86_64-linux.inc-debian = inputs.system-manager.lib.makeSystemConfig {
    specialArgs = {
      inherit
        inputs
        pkgs-custom
        pkgs-stable
        self
        username
        laptop
        ;
    };
    modules = [
      ({ pkgs, lib, ... }: {
        nixpkgs.hostPlatform = "x86_64-linux";

        users.users.root.shell = lib.mkForce "/usr/bin/bash";
        users.users.incogshift.shell = lib.mkForce "/usr/bin/fish";

        environment.sessionVariables = {
          PATH = "/usr/sbin:/usr/local/sbin:/usr/local/MATLAB/R2026b/bin/:$PATH";
        };

        home-manager.users.${username} = {
          home.sessionPath = [
            "/usr/sbin"
            "/usr/local/sbin"
          ];
        };
      })

      #self.nixosModules.stylix
      # self.nixosModules.fontsSysMgr

      self.nixosModules.homeManagerSysMgr
      self.nixosModules.user
      self.nixosModules.laptopUser

      self.nixosModules.nix
      self.nixosModules.system-manager

      # Package config
      #self.nixosModules.shell
      #self.nixosModules.cliMisc
      #self.nixosModules.ssh
      #self.nixosModules.scheduling
      #self.nixosModules.btopNvidiaIntel

      self.nixosModules.niriSysMgr
      # self.nixosModules.noctaliaSysMgr
    ];
  };
}
