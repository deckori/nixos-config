{
  pkgs,
  ...
}:

{
  services.gotenberg = {
    extraFontPackages = with pkgs; [
      corefonts
      vista-fonts
    ];
  };
}
