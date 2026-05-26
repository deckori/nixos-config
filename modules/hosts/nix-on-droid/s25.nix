{
  inputs,
  self,
  ...
}:

{
  flake.nixOnDroidConfigurations.s25 = inputs.nix-on-droid.lib.nixOnDroidConfiguration {
    pkgs = import inputs.nixpkgs-2511 {
      system = "aarch64-linux";
      config.allowUnfree = true;
    };

    modules = [
      self.nixOnDroidModules.base
      (
        { pkgs, ... }:
        {
          # Additional config if any
        }
      )
    ];

    extraSpecialArgs = {
      inherit self inputs;
      username = "nix-on-droid";
    };
  };
}
