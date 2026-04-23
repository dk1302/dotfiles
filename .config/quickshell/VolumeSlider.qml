import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
  implicitWidth: 400
  implicitHeight: 50
  x: 20
  y: 10
  radius: 7
  color: "#282828"
  border.color: "#C59A58"
  border.width: 2
  opacity: 0.8
  // x: root.x - implicitWidth / 2
  // y: root.y + implicitHeight / 2

  RowLayout {
    anchors {
      fill: parent
      leftMargin: 15
      rightMargin: 15
    }


    Slider {
      id: volumeSlider
      Layout.fillWidth: true
      from: 0
      to: 1
      stepSize: 0.01
      value: Pipewire.defaultAudioSink?.audio.volume ?? 0

      onValueChanged: {
        Pipewire.defaultAudioSink.audio.volume = value;
      }


      background: Rectangle {
          x: volumeSlider.leftPadding
          y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
          implicitWidth: 200
          implicitHeight: 15
          width: volumeSlider.availableWidth
          height: implicitHeight
          radius: 7
          color: "#16181a"

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

          Timer {
            id: exitTimer
            interval: 1000
            onTriggered: volumeButton.shouldShowOsd = false
          }

          Rectangle {
              width: volumeSlider.visualPosition * parent.width
              height: parent.height
              color: "#D6CAA5"
              radius: 7
          }
      }

      handle: Rectangle {
          x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.availableWidth - width)
          y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
          implicitWidth: 0
          implicitHeight: 0
      }
    }
  }
}
