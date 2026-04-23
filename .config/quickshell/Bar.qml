import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      color: "transparent"

      implicitHeight: 55

      anchors {
        top: true
        left: true
        right: true
      }

      LeftIsland {}

      Clock{}

      Apps {}

      MiddleIsland {}

      Workspaces {}

      RightIsland {}

      Power {}

      Bluetooth {}

      NetworkStatus {}

      Volume {}

      Theme {}

    }
  }
}
