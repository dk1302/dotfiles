import QtQuick

Rectangle {
  x: rightIslandX 
  y: panelY - 10
  width: checkVolume() ? 235 : 225
  height: 40
  color: Colors.background
  // radius: 7 
  // border.color: Colors.border
  // border.width: 2
  opacity: 0.4
}
