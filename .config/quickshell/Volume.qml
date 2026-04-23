import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls

Text {
    id: volumeButton
    property bool containsMouse: false

    PwObjectTracker {
      objects: [ Pipewire.defaultAudioSink ]
    }

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
        volumeButton.shouldShowOsd = true;
        volumeButton.containsMouse = true;
        hideTimer.restart();
      }
      onExited: {
        volumeButton.containsMouse = false;
      }
    }

    Timer {
      id: hideTimer
      interval: 3000
      onTriggered: volumeButton.shouldShowOsd = false
    }

    x: 2405
    y: 25

    text: Pipewire.defaultAudioSink?.muted ? "Muted" : "  " + Math.round(100 * Pipewire.defaultAudioSink?.audio.volume) + "%"
    color: containsMouse ? "#C59A58" : "#ebdbb2"
    font.family: "RecMono Linear Nerd Font"
    font.pointSize: 12

    VolumePanel {}
}
