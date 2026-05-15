import QtQuick

Text {
  x: leftIslandX + 15
  y: panelY

  text: Time.time
  color: Colors.foreground
  font.family: "RecMono Linear Nerd Font"
  font.pointSize: 12
}
