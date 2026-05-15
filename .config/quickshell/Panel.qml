import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls

LazyLoader {
  active: panelButton.shouldShowOsd

  FloatingWindow {
    color: "transparent"

    Rectangle {
      implicitWidth: 420
      implicitHeight: 140
      // y: 20
      // x: 2060
      radius: 7
      color: Colors.background
      // opacity: 0.8
      // border.color: Colors.active
      // border.width: 2

      VolumeSlider {}

      Power{}
    }
  }

}
