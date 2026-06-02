import QtQuick

Rectangle {
  x: leftIslandX
  y: panelY - 10
  width: checkTime() ? 315 : 305
  height: 40
  color: Colors.background
  opacity: 0.4
}

