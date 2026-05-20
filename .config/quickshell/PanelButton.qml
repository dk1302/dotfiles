import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import Quickshell.Io

Text {
  id: panelButton
  x: clicked ? rightIslandX + 20 : rightIslandX + 18
  y: clicked ? panelY : panelY - 4 
  property bool shouldShowOsd: false
  property bool containsMouse: false
  property bool clicked: false
  text: "󰍜"
  color: containsMouse ? Colors.border : Colors.foregroundAlt
  font.pointSize: clicked ? 13 : 17 
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
    onPressed: {
      panelButton.clicked = true
      clickTimer.restart()
      shouldShowOsd = !shouldShowOsd;
    }
    onEntered: panelButton.containsMouse = true
    onExited: panelButton.containsMouse = false

    Timer {
      id: clickTimer
      interval: 150
      onTriggered: panelButton.clicked = false
    }
  }

  Panel {}
}
