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
      text: hasConnection && isEnabled ? "" : isEnabled ? "󰂯 " : "󰂲"
      color: containsMouse ? Colors.border : Colors.foreground
      font.pointSize: 15
      font.family: "RecMono Linear Nerd Font"
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: blueman.startDetached()
        onEntered: icon.containsMouse = true
        onExited: icon.containsMouse = false
      }

    }
  }
}
