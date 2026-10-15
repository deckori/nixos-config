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

      # self.nixosModules.niriSysMgr
      # self.nixosModules.noctaliaSysMgr
    ];
  };
}
