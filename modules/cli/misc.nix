{ inputs, ... }:

{
  flake.nixosModules.cliMisc =
    { pkgs, username, ... }:
    {
      programs.nano.enable = false;
      programs.vim = {
        enable = true;
      };
      programs.yazi = {
        enable = true;
      };
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
      environment.systemPackages = with pkgs; [
        veracrypt
        android-tools
        inputs.subtui.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      users.users.${username}.extraGroups = [ "adbusers" ];
    };

  flake.homeModules.cliMisc =
    { pkgs, username, ... }:
    {
      home.packages = with pkgs; [
        inputs.subtui.packages.${pkgs.stdenv.hostPlatform.system}.default
        # (inputs.wptui.packages.${pkgs.stdenv.hostPlatform.system}.wp-tui.overrideAttrs (old: {
        #   vendorHash = "sha256-dGQJJTuiPqp+s9leWl02lbm58loA9yb7gQZEYtDH7tk=";
        # }))

        # Scheduling
        vdirsyncer
        khal
      ];
    };
}
