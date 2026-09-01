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
}
