import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io

Text {
    x: rightIslandX - 132
    y: panelY
    property string brightness: ""

    text: brightness
    color: Colors.foregroundAlt
    font.family: "RecMono Linear Nerd Font"
    font.pointSize: 12

    Process {
      id: getBrightness
      running: true
      command: ["sh", "-c", "wl-gammarelay-rs watch '{t}K {bp}%'"]
      stdout: StdioCollector {
        onRead: brightness = this.text;
      }
    }
}
