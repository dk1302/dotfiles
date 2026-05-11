import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  x: rightIslandX + 18
  y: panelY

  Process {
    id: power
    command: ["powermenu"]
  }

  Rectangle {
    color: "transparent"
    implicitWidth: 30
    implicitHeight: 30

    Text {
      id: app
      property bool containsMouse: false
      text: "⏻"
      color: containsMouse ? Colors.border : Colors.foreground
      font.pointSize: 13 
      font.family: "RecMono Linear Nerd Font"
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: power.startDetached()
        onEntered: app.containsMouse = true
        onExited: app.containsMouse = false
      }

    }
  }
}
