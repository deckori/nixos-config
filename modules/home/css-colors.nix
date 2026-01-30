{ config, ... }:

with config.lib.stylix.colors;
let
  color = config.lib.stylix.colors;

  inherit (color)
    base00
    base01
    base02
    base03
    base04
    base05
    base08
    base09
    base0A
    base0B
    base0C
    base0D
    base0E
    base0F
    ;

  hex = c: "#${c}";
  rgb = c: "rgb(${c})";
in
{
  xdg.configFile."hex-colors.css" = {
    text = ''
      @define-color base00 ${base00}
      @define-color base01 ${base01}
      @define-color base02 ${base02}
      @define-color base03 ${base03}
      @define-color base04 ${base04}
      @define-color base05 ${base05}
      @define-color base08 ${base08}
      @define-color base09 ${base09}
      @define-color base0A ${base0A}
      @define-color base0B ${base0B}
      @define-color base0C ${base0C}
      @define-color base0D ${base0D}
      @define-color base0E ${base0E}
      @define-color base0F ${base0F}
    '';
  };
}
