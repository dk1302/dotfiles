import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Io

Rectangle {
  id: volumeSliderContainer
  implicitWidth: 418
  implicitHeight: 50
  y: 4
  x: 2
  color: "transparent"


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
          id: sliderBackground
          property bool clicked: false
          x: volumeSlider.leftPadding
          y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
          implicitWidth: 200
          implicitHeight: 20
          width: volumeSlider.availableWidth
          height: implicitHeight
          radius: 7
          color: Colors.empty

          Timer {
            id: hideTimer
            interval: 500
            onTriggered: {
              panelButton.shouldShowOsd = false
            }
          }

          Connections {
            target: Pipewire.defaultAudioSink.audio

            onVolumeChanged: {
              sliderBackground.clicked = true
            }
          }

          MouseArea {
            anchors.fill: parent
            hoverEnabled: sliderBackground.clicked ? true : false
            onEntered: hideTimer.stop()
            onExited: hideTimer.restart()
          }

          Rectangle {
              width: volumeSlider.visualPosition * parent.width
              height: parent.height
              color: Colors.foreground
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
