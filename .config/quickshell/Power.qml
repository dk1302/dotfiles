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
        property bool clicked: false
        color: checkColorEvent()
        border.color: Colors.background
        border.width: checkBorderWidth()
        implicitWidth: 65
        implicitHeight: 65
        radius: 10

        Behavior on color {
          ColorAnimation {
            duration: 100
          }
        }

        Behavior on border.width {
          PropertyAnimation {
            duration: 100
            easing.type: Easing.InOutQuint
          }
        }

        function checkColorEvent() {
          if (powerButton.clicked) {
            return Colors.backgroundAlt
          } else if (powerButton.containsMouse) {
            return Colors.active
          } else {
            return Colors.backgroundAlt
          }
        }

        function checkBorderWidth() {
          if (powerButton.clicked) {
            return 4
          } else {
            return 0
          }
        }

        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          onPressed: {
            powerButton.clicked = true
            clickTimer.restart()
            closeTimer.restart()
          }
          onEntered: {
            powerButton.containsMouse = true
          }
          onExited: {
            powerButton.containsMouse = false
            powerButton.clicked = false
          }

          Timer {
            id: closeTimer
            interval: 300
            onTriggered: {
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
          }

          Timer {
            id: clickTimer
            interval: 150
            onTriggered: {
              powerButton.clicked = false
            }
          }
        }

        Text {
          x: iconPosition(index)
          y: parent.height / 4
          text: getPowerIcon(index)
          color: checkTextColor()
          font.pointSize: 22
          font.family: "RecMono Linear Nerd Font"

          // Behavior on color {
          //   ColorAnimation {
          //     duration: 100
          //   }
          // }
        }

        function checkTextColor() {
          if (powerButton.clicked) {
            return Colors.background
          } else if (powerButton.containsMouse) {
            return Colors.empty
          } else {
            return Colors.foreground
          }
        }
      }
    }
  }
}
