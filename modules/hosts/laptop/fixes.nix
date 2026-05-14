{ config, ... }:

{
  flake.nixosModules.laptopSuspendFix =
    { ... }:
    {
      boot.blacklistedKernelModules = [
        "spd5118" # blacklist to avoid these issues: [  146.522972] spd5118 14-0050: Failed to write b = 0: -6    [  146.522974] spd5118 14-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6     [  146.522978] spd5118 14-0050: PM: failed to resume async: error -6, Sourced from: https://github.com/maeren/red-flake-nix/blob/f7269498a62fc542f89a5186e7d5eda9ae6db189/nixos/hosts/stellaris/hardware.nix#L63
      ];
    };

  flake.nixosModules.laptopTouchpadFix =
    { ... }:
    {
      # Fix for unresponsive touchpad. I honestly have no idea what this does, but i've seen poeple using this for fixes and it somehow worked.
      boot.kernelParams = [
        "i8042.reset"
        "i8042.nomux"
        "i8042.nopnp"
      ];
    };
}
