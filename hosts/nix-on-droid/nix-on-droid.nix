{
  pkgs,
  ...
}:

{
  android-integration = {
    termux-setup-storage.enable = true;
  };
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
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

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Asia/Qatar";
}
