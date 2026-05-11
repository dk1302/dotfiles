import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls

Text {
    id: volumeButton
    property bool containsMouse: false

    Connections {
      target: Pipewire.defaultAudioSink?.audio

      function onVolumeChanged() {
        volumeButton.shouldShowOsd = true;
        hideTimer.restart();
      }
    }

    property bool shouldShowOsd: false

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onEntered: {
        volumeButton.containsMouse = true;
      }
      onClicked: {
        volumeButton.shouldShowOsd = true;
        hideTimer.restart();
      }
      onExited: {
        volumeButton.containsMouse = false;
      }
    }

    Timer {
      id: hideTimer
      interval: 2000
      onTriggered: volumeButton.shouldShowOsd = false
    }

    x: rightIslandX + 105
    y: panelY

    text: Pipewire.defaultAudioSink?.muted ? "Muted" : "  " + Math.round(100 * Pipewire.defaultAudioSink?.audio.volume) + "%"
    color: containsMouse ? Colors.border : Colors.foreground
    font.family: "RecMono Linear Nerd Font"
    font.pointSize: 12

    VolumePanel {}
}
