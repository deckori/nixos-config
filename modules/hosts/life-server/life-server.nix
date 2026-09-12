{ inputs, self, ... }:

{
  flake.systemConfigs.life-server = inputs.system-manager.lib.makeSystemConfig {
    modules = [
      # # Service config
      self.nixosModules.caddy
      self.nixosModules.feishin
      self.nixosModules.qbittorrent
      self.nixosModules.navidrome
      self.nixosModules.baikal
    ];
  };
}
