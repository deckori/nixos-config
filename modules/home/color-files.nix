{ config, ... }:
with config.lib.stylix;
let
  inherit (config.lib.formats.rasi) mkLiteral;
  mkRgba =
    opacity': color:
    let
      c = colors;
      r = c."${color}-rgb-r";
      g = c."${color}-rgb-g";
      b = c."${color}-rgb-b";
    in
    mkLiteral "rgba ( ${r}, ${g}, ${b}, ${opacity'} % )";
  mkRgb = mkRgba "100";
  rofiOpacity = toString (builtins.ceil (opacity.popups * 100));
in
{
  xdg.configFile."colors-rgb.css" = {
    text = ''
      @define-color base00 ${rgb base00}
      @define-color base01 ${rgb base01}
      @define-color base02 ${rgb base02}
      @define-color base03 ${rgb base03}
      @define-color base04 ${rgb base04}
      @define-color base05 ${rgb base05}
      @define-color base08 ${rgb base08}
      @define-color base09 ${rgb base09}
      @define-color base0A ${rgb base0A}
      @define-color base0B ${rgb base0B}
      @define-color base0C ${rgb base0C}
      @define-color base0D ${rgb base0D}
      @define-color base0E ${rgb base0E}
      @define-color base0F ${rgb base0F}
    '';
  };
}
