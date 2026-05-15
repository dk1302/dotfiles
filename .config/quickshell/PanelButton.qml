import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import Quickshell.Io

Text {
  id: panelButton
  x: rightIslandX + 18
  y: panelY - 3
  property bool shouldShowOsd: false
  property bool containsMouse: false
  text: "󰮫"
  color: containsMouse ? Colors.border : Colors.foreground
  font.pointSize: 17 
  font.family: "RecMono Linear Nerd Font"

  Process {
    id: noFocus
    command: ["sh", "-c", "hyprctl dispatch setprop active opacity 0.65 override"]
  }

  Process {
    id: focus
    command: ["sh", "-c", "hyprctl dispatch setprop active opacity 1 override"]
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onClicked: {
      shouldShowOsd = !shouldShowOsd;
      // if (shouldShowOsd) {
      //   noFocus.running = true;
      // } else {
      //   focus.running = true;
      // }
    }
    onEntered: panelButton.containsMouse = true
    onExited: panelButton.containsMouse = false
  }

  Panel {}
}
