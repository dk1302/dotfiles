import QtQuick

Rectangle {
  x: leftIslandX
  y: panelY - 10
  width: checkTime() ? 345 : 330
  height: 40
  color: Colors.background
  radius: 7 
  border.color: Colors.border
  border.width: 2
  opacity: 0.8
}

