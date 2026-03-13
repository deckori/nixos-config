{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      pciutils
      nushell
    ];
    pathsToLink = [
      "/share/bash-completion"
    ];
  };

  programs.bash = {
    enable = true;
    completion.enable = true;
  };

  environment.etc."shells".text = ''
    /run/current-system/sw/bin/nu
    ${pkgs.nushell}/bin/nu
  '';
}
