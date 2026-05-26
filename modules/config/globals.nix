{ inputs, ... }:
{
  # This makes 'username' available as an argument to all flake-parts modules
  _module.args.username = inputs.nixpkgs.lib.strings.removeSuffix "\n" (
    builtins.readFile "${inputs.secrets}/users/main"
  );
}
