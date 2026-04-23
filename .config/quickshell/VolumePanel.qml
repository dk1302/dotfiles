import QtQuick
import Quickshell
// import Quickshell.Services.Pipewire
// import Quickshell.Widgets
// import QtQuick.Layouts
// import QtQuick.Controls

LazyLoader {
  active: volumeButton.shouldShowOsd

  PanelWindow {
    implicitWidth: 430
    implicitHeight: 100

    anchors {
      top: true
      right: true
    }

    color: "transparent"

    VolumeSlider {}
  }
}
