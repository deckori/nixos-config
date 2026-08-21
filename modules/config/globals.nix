{ inputs, pkgs, ... }:
let
  system = "x86_64-linux";
in
{
  _module.args = {
    pkgs-custom = inputs.nixpkgs-custom.packages.${system};

    # This makes 'username' available as an argument to all flake-parts modules
    username = inputs.nixpkgs.lib.strings.removeSuffix "\n" (
      builtins.readFile "${inputs.secrets}/users/main"
    );
  };
}
