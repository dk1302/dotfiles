import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  x: checkVolume() ? rightIslandX + 173 : rightIslandX + 163
  y: panelY

  function getAppName(index) {
    if (index === 0) {
      return "󰐝"
    } else if (index === 1) {
      return "󰸉"
    } else {
      return ""
    }
  }

  Process {
    id: wallpaper
    command: ["waypaper"]
  }
  Process {
    id: theme
    command: ["sh", "-c", "hyprpicker | wl-copy"]
  }
  Process {
    id: gba
    command: ["sh", "-c", "cd ~/gba && mgba-qt red.gba -p Odyssey.ups"]
  }

  RowLayout {
    spacing: -2

    Repeater {
      model: 3

      Rectangle {
        color: "transparent"
        implicitWidth: 30
        implicitHeight: 30


        Text {
          id: app
          property bool containsMouse: false
          property bool clicked: false
          text: getAppName(index)
          color: containsMouse ? Colors.border : Colors.foregroundAlt
          font.pointSize: clicked ? 9 : 13 
          x: clicked ? 2 : 0
          y: clicked ? 3 : 0
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
              app.clicked = true
              if (index === 0) {
                gba.startDetached()
              } else if (index === 1) {
                wallpaper.startDetached()
              } else {
                theme.startDetached()
              } 
            }
            onReleased: app.clicked = false
            onEntered: app.containsMouse = true
            onExited: app.containsMouse = false
          }

        }
      }
    }
  }
}
