{ ... }:

{
  # The following convert the laptop's co-pilot key into a normal right control key
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        /*
          See the keyboard ID and key ID by using the following:
          # systemctl stop keyd # U need to stop keyd for the following to work
          # keyd monitor -t
        */
        ids = [ "048d:c996:e1dedece" ];
        settings = {
          main = {
            "leftshift+leftmeta+f23" = "rightcontrol"; # copilot = right control
          };
          otherlayer = { };
        };
      };
    };
  };

  boot.blacklistedKernelModules = [
    "spd5118" # blacklist to avoid these issues: [  146.522972] spd5118 14-0050: Failed to write b = 0: -6    [  146.522974] spd5118 14-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6     [  146.522978] spd5118 14-0050: PM: failed to resume async: error -6, Sourced from: https://github.com/maeren/red-flake-nix/blob/f7269498a62fc542f89a5186e7d5eda9ae6db189/nixos/hosts/stellaris/hardware.nix#L63
  ];

}
