import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  x: 2480
  y: 25

  function getAppName(index) {
    if (index === 0) {
      return "󰸉"
    } else {
      return ""
    }
  }

  Process {
    id: wallpaper
    command: ["waypaper"]
  }
  Process {
    id: theme
    command: ["hyprpicker | wl-copy"]
  }

  RowLayout {
    spacing: 2

    Repeater {
      model: 2

      Rectangle {
        color: "transparent"
        implicitWidth: 30
        implicitHeight: 30


        Text {
          id: app
          property bool containsMouse: false
          text: getAppName(index)
          color: containsMouse ? "#C59A58" : "#ebdbb2"
          font.pointSize: 13 
          font.family: "RecMono Linear Nerd Font"
          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
              if (index === 0) {
                wallpaper.startDetached()
              } else {
                theme.startDetached()
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
