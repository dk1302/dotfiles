import QtQuick

Text {
  x: 400
  y: panelY 

  // text: DwlService.outputs
  // text: DwlService.tags
  text: DwlService.clients
  color: Colors.foregroundAlt
  font.family: "RecMono Linear Nerd Font"
  font.pointSize: 12
}
