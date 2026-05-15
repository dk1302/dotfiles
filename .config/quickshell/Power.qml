import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  y: 55
  x: 18

  function getPowerIcon(index) {
    if (index === 0) {
      return "󰤄"
    } else if (index === 1) {
      return "󰗽"
    } else if (index === 2) {
      return ""
    } else if (index === 3) {
      return ""
    } else {
      return ""
    } 
  }

  function iconPosition(index) {
    if (index === 0) {
      return 24
    } else if (index === 1) {
      return 21
    } else if (index === 2) {
      return 18
    } else if (index === 3) {
      return 22
    } else {
      return 20
    }
  }

  Process {
    id: sleep
    command: ["sh", "-c", "systemctl suspend"]
  }
  Process {
    id: exit
    command: ["sh", "-c", "hyprctl dispatch exit"]
  }
  Process {
    id: firmware
    command: ["sh", "-c", "systemctl reboot --firmware -i"]
  }
  Process {
    id: reboot
    command: ["sh", "-c", "systemctl reboot -i"]
  }
  Process {
    id: shutdown
    command: ["sh", "-c", "systemctl poweroff -i"]
  }


  RowLayout {
    spacing: 15 

    Repeater {
      model: 5 


      Rectangle {
        id: powerButton
        property bool containsMouse: false
        color: containsMouse ? Colors.active : Colors.backgroundAlt
        implicitWidth: 65
        implicitHeight: 65
        radius: 10
        // border.color: Colors.active
        // border.color: containsMouse ? Colors.active : Colors.empty
        // border.width: 2
        // opacity: 0.9

        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          onClicked: {
            if (index === 0) {
              sleep.startDetached();
              panelButton.shouldShowOsd = false;
            } else if (index === 1) {
              exit.startDetached();
              panelButton.shouldShowOsd = false
            } else if (index === 2) {
              firmware.startDetached();
              panelButton.shouldShowOsd = false
            } else if (index === 3) {
              reboot.startDetached();
              panelButton.shouldShowOsd = false
            } else {
              shutdown.startDetached();
              panelButton.shouldShowOsd = false
            }
          }
          onEntered: {
            powerButton.containsMouse = true
            hideTimer.stop();
          }
          onExited: powerButton.containsMouse = false
        }

        Text {
          x: iconPosition(index)
          y: parent.height / 4
          text: getPowerIcon(index)
          color: powerButton.containsMouse ? Colors.empty : Colors.foreground
          font.pointSize: 22
          font.family: "RecMono Linear Nerd Font"
        }
      }
    }
  }
}
