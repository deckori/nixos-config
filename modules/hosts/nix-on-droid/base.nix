{ ... }:

{
  flake.nixOnDroidModules.base =
    { pkgs, ... }:
    {
      android-integration = {
        termux-setup-storage.enable = true;
      };

      environment.packages = with pkgs; [
        vim
        openssh
        which
        gnugrep
        tmux
        yazi
        git
        killall
        hostname
        man
        ripgrep
        gnupg
        gnutar
        _7zz
      ];

      environment.etcBackupExtension = ".bak";
      system.stateVersion = "24.05";

      nix.extraOptions = ''
        experimental-features = nix-command flakes
      '';

      time.timeZone = "Asia/Qatar";
    };
}
