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
      # # Service config
      # self.nixosModules.baikal

      self.nixosModules.nix
      # self.nixosModules.lix
      self.nixosModules.life-serverConfig
    ];
  };
}
