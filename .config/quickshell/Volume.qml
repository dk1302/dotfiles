import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Controls

Text {
    x: rightIslandX + 105
    y: panelY

    text: Pipewire.defaultAudioSink?.muted ? "Muted" : "  " + Math.round(100 * Pipewire.defaultAudioSink?.audio.volume) + "%"
    color: Colors.foreground
    font.family: "RecMono Linear Nerd Font"
    font.pointSize: 12
}
