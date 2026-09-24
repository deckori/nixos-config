{
  inputs,
  self,
  username,
  ...
}:

{
  flake.systemConfigs.life-server = inputs.system-manager.lib.makeSystemConfig {
    specialArgs = {
      inherit
        inputs
        self
        username
        ;
    };
    modules = [

      self.nixosModules.nix
      self.nixosModules.lifeServerExternalImports
      self.nixosModules.shared
      self.nixosModules.user
      self.nixosModules.serverUser
      # self.nixosModules.lix
      self.nixosModules.lifeServerConfig
    ];
  };
}
