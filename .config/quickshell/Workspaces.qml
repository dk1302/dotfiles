import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  x: middleIslandX + 5
  y: panelY + 20
  opacity: 0.8

  Repeater {
    model: 4 

    Rectangle {
        id: workspaceContainer
        color: "transparent"

        property int activeTag: DwlService.activeTag
        property bool isActive: index + 1 === activeTag
        property bool hasWindows: DwlService.clients[index] > 0

        function checkActive() {
          var x = 0
          if (isActive) {
            x = 30 + (index * 30)
          } else if (activeTag > 4) {
            x = 20 + (index * 40)
          } else if ((index + 1) < activeTag) {
            x = 20 + (index * 30)
          } else if ((index + 1) > activeTag) {
            x = 40 + (index * 30)
          }
          return x
        }

        x: checkActive()

        Behavior on x {
          PropertyAnimation {
            duration: 200;
            easing.type: Easing.InOutQuint
          }
        }

        Rectangle {
            id: workspaceIndicator
            property bool containsMouse: false

            function checkHover() {
              if (workspaceContainer.isActive) {
                return Colors.foregroundAlt
              } else if (workspaceIndicator.containsMouse) {
                return workspaceContainer.hasWindows ? Colors.border : Colors.active
              } else {
                return Colors.foreground
              }
            }

            color: "transparent"
            border.color: checkHover()
            border.width: workspaceIndicator.containsMouse || workspaceContainer.isActive ? 5 : 2
            Behavior on border.color {
              ColorAnimation {
                duration: 150
              }
            }
            Behavior on border.width {
              NumberAnimation {
                duration: 150
              }
            }

            implicitWidth: parent.isActive ? 40: 20
            Behavior on implicitWidth {
              PropertyAnimation {
                duration: 200
                easing.type: Easing.InOutQuint
              }
            }
            implicitHeight: 20
            radius: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            Process {
              id: view
              command: ["mmsg", "dispatch", "view,", (index+1)]
            }

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true

              onEntered: workspaceIndicator.containsMouse = true
              onPressed: DwlService.switchToTag(view)
              onExited: workspaceIndicator.containsMouse = false
            }
        }

    }
  }
}
