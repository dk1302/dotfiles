import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  x: checkTime() ? leftIslandX + 195 : leftIslandX + 180
  y: panelY

  function getAppName(index) {
    if (index === 0) {
      return ""
    } else if (index === 1) {
      return "󰐝"
    } else if (index === 2) {
      return ""
    } else if (index === 3) {
      return ""
    } else {
      return ""
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
    id: gba
    command: ["sh", "-c", "cd ~/gba && mgba-qt red.gba -p Odyssey.ups"]
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
          property bool clicked: false
          property bool containsMouse: false
          text: getAppName(index)
          color: containsMouse ? Colors.border : Colors.foregroundAlt

          Behavior on color {
            ColorAnimation {
              duration: 150
            }
          }

          function checkPointSize() {
            if (index != 1 && index != 2) {
              return clicked ? 8 : 12
            } else {
              return clicked ? 10 : 14
            }
          }
          font.pointSize: checkPointSize()
          function checkY() {
            if (index == 1 || index == 2) {
              return clicked ? 1 : -2 
            } else {
              return clicked ? 3 : 0
            }
          }
          function checkX() {
            if (index == 3) {
              return clicked ? 4 : 2 
            } else {
              return clicked ? 3 : 0
            }
          }
          x: checkX()
          y: checkY()
          font.family: "RecMono Linear Nerd Font"

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
                firefox.startDetached()
              } else if (index === 1) {
                gba.startDetached()
              } else if (index === 2) {
                steam.startDetached()
              } else if (index === 3) {
                music.startDetached()
              } else {
                clickTimer.restart()
                launcher.startDetached()
              }
            }
            onReleased: {
              if(index < 4) {
                app.clicked = false
              }
            }
            onEntered: app.containsMouse = true
            onExited: app.containsMouse = false

            Timer {
              id: clickTimer
              interval: 150
              onTriggered: app.clicked = false
            }
          }

        }
      }
    }
  }
}
