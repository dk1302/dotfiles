import QtQuick

Rectangle {
  x: rightIslandX 
  y: panelY - 10
  width: checkVolume() ? 260 : 250
  height: 40
  color: Colors.background
  opacity: 0.4
}
