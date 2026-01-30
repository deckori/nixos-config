{ config, ... }:
let
  colors = config.lib.stylix.colors;

  # mkRgb =
  #   name:
  #   let
  #     r = colors."${name}-rgb-r";
  #     g = colors."${name}-rgb-g";
  #     b = colors."${name}-rgb-b";
  #   in
  #   "rgb(${r}, ${g}, ${b})";

  mkRgba =
    opacity: name:
    let
      r = colors."${name}-rgb-r";
      g = colors."${name}-rgb-g";
      b = colors."${name}-rgb-b";
    in
    "rgba(${r}, ${g}, ${b}, ${config.lib.stylix.opacity})";

in
{
  xdg.configFile."colors-rgb.css" = {
    text = ''
      @define-color base00 ${mkRgba "base00"}
      @define-color base01 ${mkRgba "base01"}
      @define-color base02 ${mkRgba "base02"}
      @define-color base03 ${mkRgba "base03"}
      @define-color base04 ${mkRgba "base04"}
      @define-color base05 ${mkRgba "base05"}
      @define-color base08 ${mkRgba "base08"}
      @define-color base09 ${mkRgba "base09"}
      @define-color base0A ${mkRgba "base0A"}
      @define-color base0B ${mkRgba "base0B"}
      @define-color base0C ${mkRgba "base0C"}
      @define-color base0D ${mkRgba "base0D"}
      @define-color base0E ${mkRgba "base0E"}
      @define-color base0F ${mkRgba "base0F"}
    '';
  };
}
