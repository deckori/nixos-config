{ inputs, pkgs, ... }:
{
  _module.args = {
    pkgs-custom = import inputs.nixpkgs-custom {
      system = pkgs.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };

    # This makes 'username' available as an argument to all flake-parts modules
    username = inputs.nixpkgs.lib.strings.removeSuffix "\n" (
      builtins.readFile "${inputs.secrets}/users/main"
    );
  };
}
