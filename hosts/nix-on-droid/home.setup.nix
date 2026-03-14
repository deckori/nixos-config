{ pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry = {
      package = pkgs.pinentry-tty;
      program = "pinentry-tty";
    };
    enableNushellIntegration = true;
  };
}
