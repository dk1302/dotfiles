import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
  implicitWidth: 50
  implicitHeight: 400
  y: 10
  radius: 7
  color: Colors.background
  border.color: Colors.border
  border.width: 2
  opacity: 0.8

  Timer {
    id: exitTimer
    interval: 1000
    onTriggered: volumeButton.shouldShowOsd = false
  }

  RowLayout {
    anchors {
      fill: parent
      leftMargin: 15
      rightMargin: 15
    }


    Slider {
      id: volumeSlider
      orientation: Qt.Vertical
      Layout.fillWidth: true
      from: 0 
      to: 1 
      stepSize: 0.01
      value: Pipewire.defaultAudioSink?.audio.volume ?? 0

      onValueChanged: {
        Pipewire.defaultAudioSink.audio.volume = value;
      }


      background: Rectangle {
          x: volumeSlider.leftPadding + volumeSlider.availableWidth / 2 - width / 2
          y: volumeSlider.bottomPadding 
          implicitWidth: 15
          implicitHeight: 370
          width: implicitWidth
          height: volumeSlider.availableHeight
          radius: 7
          color: Colors.empty

          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
              hideTimer.stop();
              exitTimer.stop();
            }
            onExited: {
              exitTimer.restart();
            }
          }

          Rectangle {
              y: volumeSlider.bottomPadding + (volumeSlider.availableHeight - height)
              width: parent.width
              height: (1 - volumeSlider.visualPosition) * parent.height
              color: Colors.foreground
              radius: 7
          }
      }

      handle: Rectangle {
          x: volumeSlider.leftPadding + volumeSlider.availableWidth / 2 - Width / 2
          y: volumeSlider.bottomPadding + (1 - volumeSlider.visualPosition) * (volumeSlider.availableHeight - height)
          implicitWidth: 0
          implicitHeight: 0
      }
    }
  }
}
