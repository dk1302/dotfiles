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
          implicitHeight: clicked ? 20 : 15
          opacity: clicked ? 1 : 0.8
          width: volumeSlider.availableWidth
          height: implicitHeight
          radius: 7
          color: Colors.empty

          Behavior on implicitHeight {
            PropertyAnimation {
              duration: 200
              easing.type: Easing.InOutQuint
            }
          }

          Timer {
            id: hideTimer
            interval: 300
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
            hoverEnabled: true
            onEntered: hideTimer.stop()
            onPressed: sliderBackground.clicked = true
            onExited: {
              if (sliderBackground.clicked) {
                sliderBackground.clicked = false
                hideTimer.restart()
              }
            }
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
