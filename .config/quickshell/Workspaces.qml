import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
  x: 1220
  y: 45
  opacity: 0.8

  Repeater {
    model: 3

    Rectangle {
        id: workspaceContainer
        color: "transparent"

        property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        property bool hasWindows: workspace !== null

        function checkActive() {
          var x = 0
          if (Hyprland.focusedWorkspace?.id === (1) && index === 0) {
            x = 30
          } else if (Hyprland.focusedWorkspace?.id === (2) && index === 1) {
            x = 60
          } else if (Hyprland.focusedWorkspace?.id === (3) && index === 2) {
            x = 90
          } else if (index === 0) {
            x = 20
          } else if (Hyprland.focusedWorkspace?.id === (3) && index === 1) {
            x = 50
          } else if (Hyprland.focusedWorkspace?.id === (1) && index === 1) {
            x = 70
          } else if (index === 2) {
            x = 100
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
                return "#ebdbb2"
              } else if (workspaceIndicator.containsMouse) {
                return workspaceContainer.hasWindows ? "#C59A58" : "#665c54"
              } else {
                return "#16181a"
              }
            }



            color: checkHover()
            Behavior on color {
              ColorAnimation {
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
            radius: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true

              function clickWorkspace() {
                Hyprland.dispatch("workspace " + (index + 1))
                return true
              }

              onEntered: workspaceIndicator.containsMouse = true
              onClicked: Hyprland.dispatch("workspace " + (index + 1))
              onExited: workspaceIndicator.containsMouse = false
            }
        }

    }
  }
}
