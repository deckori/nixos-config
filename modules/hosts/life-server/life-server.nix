{ inputs, self, ... }:

{
  flake.systemConfigs.life-server = inputs.system-manager.lib.makeSystemConfig {
    modules = [
      # # Service config
      # self.nixosModules.baikal
      ({ pkgs, ... }: {
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        system-manager.allowAnyDistro = true;

        nixpkgs.hostPlatform = "x86_64-linux";

        environment.systemPackages = with pkgs; [
          aw-server-rust
        ];
      })
    ];
  };
}
