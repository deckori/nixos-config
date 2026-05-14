{ config, lib, ... }:

{
  options.consuetudo.colors = {
    rgb = lib.mkOption {
      type = lib.types.functionTo lib.types.str;
      description = "Returns comma separated rgb values for a color. To be used in css files:)";
    };
    rgba = lib.mkOption {
      type = lib.types.functionTo lib.types.str;
      description = "Returns comma separated rgba values for a color. To be used in css files:)";
    };
  };

  config.consuetudo.colors = {
    rgb =
      color:
      lib.concatStringsSep "," [
        config.lib.stylix.colors."${color}-rgb-r"
        config.lib.stylix.colors."${color}-rgb-g"
        config.lib.stylix.colors."${color}-rgb-b"
      ];

    rgba =
      color: "${config.consuetudo.colors.rgb color},${toString config.stylix.opacity.applications}";
  };
}
