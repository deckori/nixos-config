{ lib, config, ... }:

{
  config = lib.mkIf config.consuetudo.gui.enable {
    qt = {
      enable = true;
    };

    stylix.targets.qt.enable = true;
  };
}
