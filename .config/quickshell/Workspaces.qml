import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
  x: middleIslandX + 5
  y: panelY + 20
  opacity: 0.8

  Repeater {
    model: 4 

    Rectangle {
        id: workspaceContainer
        color: "transparent"

        property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        property bool hasWindows: workspace !== null

        function checkActive() {
          var x = 0
          if (isActive) {
            x = 30 + (index * 30)
          } else if (Hyprland.focusedWorkspace?.id > 4) {
            x = 20 + (index * 40)
          } else if ((index + 1) < Hyprland.focusedWorkspace?.id) {
            x = 20 + (index * 30)
          } else if ((index + 1) > Hyprland.focusedWorkspace?.id) {
            x = 40 + (index * 30)
          }
          return x
        }

        x: checkActive()

        Behavior on x {
          PropertyAnimation {
            duration: 300;
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
                duration: 300
                easing.type: Easing.InOutQuint
              }
            }
            implicitHeight: 20
            radius: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true

              onEntered: workspaceIndicator.containsMouse = true
              onPressed: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + " })")
              // onPressed: Hyprland.dispatch("workspace " + (index + 1))
              onExited: workspaceIndicator.containsMouse = false
            }
        }

    }
  }
}
