import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: panel
      required property var modelData
      screen: modelData
      color: "transparent"

      anchors {
        top: true
        left: true
        right: true
      }

      // Process{
      //   id: getMonitorWidth
      //   command: ["sh", "-c", "hyprctl monitors | awk -F' ' 'NR==2 {print $1}' | awk -F'x' '{print $1}'"]
      //   stdout: StdioCollector {
      //     onStreamFinished: {
      //       var width = parseInt(this.text);
      //       if (width) {
      //         panel.width = width;
      //       }
      //     }
      //   }
      // }

      // Process{
      //   id: getMonitorHeight
      //   command: ["sh", "-c", "hyprctl monitors | awk -F' ' 'NR==2 {print $1}' | awk -F'x' '{print $1,$2}' | awk -F'@' '{print $1}' | awk -F' ' '{print $2}'"]
      //   stdout: StdioCollector {
      //     onStreamFinished: {
      //       var height = parseInt(this.text);
      //       if (height) {
      //         panel.height = height;
      //       }
      //     }
      //   }
      // }

      implicitHeight: 40

      SystemClock {
        id: clock
        precision: SystemClock.Minutes
      }

      function checkTime() {
        if (Qt.formatDateTime(clock.date, "d") > 9) {
          return true
        } else {
          return false
        }
      }

      PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
      }

      function checkVolume()  {
        if (Math.round(100 * Pipewire.defaultAudioSink?.audio.volume) > 9) {
          return true
        } else {
          return false
        }
      }

      Rectangle {
        anchors.fill: parent
        height: 40
        color: Colors.background
        opacity: 0.4
      }

      property int panelY: 10

      property int leftIslandX: 0
      LeftIsland {}

      Clock{}

      Apps {}

      property int middleIslandX: 1215
      MiddleIsland {}

      Workspaces {}

      property int rightIslandX: checkVolume() ? 2330 : 2340
      RightIsland {}

      PanelButton {}

      Bluetooth {}

      NetworkStatus {}

      Volume {}

      VolumeValue {}

      Theme {}

    }
  }
}
