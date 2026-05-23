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
      return ""
    } else if (index === 2) {
      return ""
    } else {
      return ""
    } 
  }

  Process {
    id: steam
    command: ["sh", "-c", "hyprctl dispatch \"hl.dsp.exec_cmd('steam')\""]
  }
  Process {
    id: firefox
    command: ["sh", "-c", "firefox"]
  }
  Process {
    id: music
    command: ["sh", "-c", "ytmdesktop"]
  }
  Process {
    id: launcher
    command: ["sh", "-c", "rofi -show drun -theme ~/.config/rofi/apps.rasi"]
  }

  RowLayout {
    spacing: 0

    Repeater {
      model: 4 

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
          font.pointSize: checkPointSize()
          font.family: "RecMono Linear Nerd Font"
          x: checkX()
          y: checkY()

          Behavior on color {
            ColorAnimation {
              duration: 150
            }
          }

          function checkPointSize() {
            if (index != 1) {
              return clicked ? 8 : 12
            } else {
              return clicked ? 10 : 14
            }
          }

          function checkY() {
            if (index != 1) {
              return clicked ? 3 : 0
            } else {
              return clicked ? 2 : -2
            }
          }

          function checkX() {
            if (index != 1) {
              return clicked ? -1 : -3
            } else {
              return clicked ? -3 : -6
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
                firefox.startDetached()
              } else if (index === 1) {
                steam.startDetached()
              } else if (index === 2) {
                music.startDetached()
              } else {
                clickTimer.restart()
                launcher.startDetached()
              }
            }
            onReleased: {
              if(index < 3) {
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
