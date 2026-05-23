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
      color: Colors.backgroundPale

      VolumeSlider {}

      Power{}
    }
  }

}
