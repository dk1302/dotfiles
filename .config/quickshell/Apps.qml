import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  x: checkTime() ? leftIslandX + 195 : leftIslandX + 180
  y: panelY

  function getAppName(index) {
    if (index === 0) {
      return "󰉓"
    } else if (index === 1) {
      return ""
    } else if (index === 2) {
      return "󰈹"
    } else if (index === 3) {
      return ""
    } else {
      return "󰌧"
    } 
  }

  Process {
    id: files
    command: ["nemo"]
  }
  Process {
    id: steam
    command: ["steam"]
  }
  Process {
    id: firefox
    command: ["firefox"]
  }
  Process {
    id: music
    command: ["ytmdesktop"]
  }
  Process {
    id: launcher
    command: ["sh", "-c", "rofi -show drun -theme ~/.config/rofi/apps.rasi"]
  }

  RowLayout {
    spacing: 0

    Repeater {
      model: 5 

      Rectangle {
        color: "transparent"
        implicitWidth: 30
        implicitHeight: 30


        Text {
          id: app
          property bool containsMouse: false
          text: getAppName(index)
          color: containsMouse ? Colors.border : Colors.foreground
          font.pointSize: 12 
          font.family: "RecMono Linear Nerd Font"
          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
              if (index === 0) {
                files.startDetached()
              } else if (index === 1) {
                steam.startDetached()
              } else if (index === 2) {
                firefox.startDetached()
              } else if (index === 3) {
                music.startDetached()
              } else {
                launcher.startDetached()
              }
            }
            onEntered: app.containsMouse = true
            onExited: app.containsMouse = false
          }

        }
      }
    }
  }
}
