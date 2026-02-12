{
  config,
  pkgs,
  lib,
  ...
}:
let
  kernelBundle = pkgs.linuxAndFirmware.v6_6_31;
in
{
  boot.tmp.useTmpfs = true;
  boot.loader.raspberry-pi.firmwarePackage = kernelBundle.raspberrypifw;
  boot.loader.raspberry-pi.bootloader = "kernel";
  boot.kernelPackages = kernelBundle.linuxPackages_rpi5;

  nixpkgs.overlays = lib.mkAfter [
    (final: prev: {
      inherit (kernelBundle) raspberrypiWirelessFirmware;
      inherit (kernelBundle) raspberrypifw;
    })
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    file
    git
    htop
    psmisc
    lsof
    openssl
    wget
    tmux
    screen
    ncdu
    tree
    emacs-nox
    vim
  ];

}
