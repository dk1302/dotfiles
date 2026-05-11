import QtQuick
import Quickshell
// import Quickshell.Services.Pipewire
// import Quickshell.Widgets
// import QtQuick.Layouts
// import QtQuick.Controls

LazyLoader {
  active: volumeButton.shouldShowOsd

  PanelWindow {
    id: gap

    implicitWidth: checkVolume() ? 140 : 135
    implicitHeight: 430

    anchors {
      top: true
      right: true
    }

    color: "transparent"

    Rectangle {
      implicitWidth: 70
      implicitHeight: 430

      anchors.top: parent.top
      anchors.left: parent.left

      color: "transparent"

      VolumeSlider {}
    }
  }

}
