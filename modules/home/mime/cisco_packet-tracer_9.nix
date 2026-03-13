{ pkgs, ... }:

{
  xdg.desktopEntries."cisco-packet-tracer_9" = {
    name = "Cisco Packet Tracer 9";
    icon = "${pkgs.cisco-packet-tracer_9}/opt/pt/art/app.png";
    exec = "packettracer9 %f";
    mimeType = [
      "application/x-pkt"
      "application/x-pka"
      "application/x-pkz"
      "application/x-pksz"
    ];
  };

  xdg.dataFile."mime/packages/cisco-packet-tracer.xml".text = ''
    <?xml version="1.0" encoding="utf-8"?>
    <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">

      <mime-type type="application/x-pkt">
        <glob pattern="*.pkt"/>
        <comment>Cisco Packet Tracer Topology</comment>
        <icon name="x-office-document"/>
      </mime-type>

      <mime-type type="application/x-pka">
        <glob pattern="*.pka"/>
        <comment>Cisco Packet Tracer Activity</comment>
        <icon name="x-office-document"/>
      </mime-type>

      <mime-type type="application/x-pkz">
        <glob pattern="*.pkz"/>
        <comment>Cisco Packet Tracer Compressed Project</comment>
        <icon name="x-office-document"/>
      </mime-type>

      <mime-type type="application/x-pks">
        <glob pattern="*.pks"/>
        <comment>Cisco Packet Tracer Script</comment>
        <icon name="x-office-document"/>
      </mime-type>

      <mime-type type="application/x-pksz">
        <glob pattern="*.pksz"/>
        <comment>Cisco Packet Tracer Compressed Script</comment>
        <icon name="x-office-document"/>
      </mime-type>

    </mime-info>
  '';
}
