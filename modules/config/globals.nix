{
  inputs,
  lib,
  ...
}:
let
  system = "x86_64-linux";
in
{
  config._module.args = {
    # Note: This has unfree packages
    pkgs-custom = inputs.nixpkgs-custom.packages.${system};
    pkgs-stable = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

    # This makes 'username' available as an argument to all flake-parts modules
    username = inputs.nixpkgs.lib.strings.removeSuffix "\n" (
      builtins.readFile "${inputs.secrets}/users/main"
    );

    laptop = (lib.strings.removeSuffix "\n" (builtins.readFile "${inputs.secrets}/hosts/laptop"));

  };
  options.flake.systemConfigs = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
  };
}
