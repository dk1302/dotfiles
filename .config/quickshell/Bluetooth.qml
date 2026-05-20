import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Bluetooth

Rectangle {
  id: bluetooth
  x: rightIslandX + 48
  y: panelY - 2

  property var adapter: Bluetooth.defaultAdapter
  property var connectedDevices: Bluetooth.devices.values.filter(d => d.connected)
  property bool hasConnection: connectedDevices.length > 0
  property bool isEnabled: adapter?.enabled ?? false

  Process {
    id: blueman
    command: ["blueman-manager"]
  }

  Rectangle {
    color: "transparent"
    implicitWidth: 30
    implicitHeight: 30

    Text {
      id: icon
      property bool containsMouse: false
      property bool clicked: false
      text: hasConnection && isEnabled ? "" : isEnabled ? "󰂯 " : "󰂲"
      color: containsMouse ? Colors.border : Colors.foregroundAlt
      font.pointSize: clicked ? 10 : 15
      x: clicked ? 2 : 0
      y: clicked ? 4 : 0
      font.family: "RecMono Linear Nerd Font"

      Behavior on color {
        ColorAnimation {
          duration: 150
        }
      }

      Behavior on font.pointSize {
        NumberAnimation {
          duration: 100
          easing.type: Easing.InOutQuad
        }
      }

      Behavior on x {
        NumberAnimation {
          duration: 100
          easing.type: Easing.InOutQuad
        }
      }

      Behavior on y {
        NumberAnimation {
          duration: 100
          easing.type: Easing.InOutQuad
        }
      }

      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
          icon.clicked = true
          blueman.startDetached()
        }
        onReleased: icon.clicked = false
        onEntered: icon.containsMouse = true
        onExited: icon.containsMouse = false

      }

    }
  }
}
