{ ... }:

{
  flake.nixosModules.scheduling =
    { pkgs, pkgs-custom, ... }:
    {
      environment.systemPackages = with pkgs; [
        # Scheduling
        vdirsyncer
        khal

        pkgs-custom.khali
      ];

      services.atd.enable = true;
    };
}
