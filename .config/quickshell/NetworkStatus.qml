import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell

Rectangle {
  id: network
  x: 2371
  y: 25

  property bool wifiStatus: false 
  property bool ethernetStatus: false
  property string icon: "󰌙"

  Process {
    id: checkEthernet
    running: false
    command: ["sh", "-c", "nmcli c show --active | grep ethernet"]
    stdout: StdioCollector {
      onStreamFinished: {
        network.ethernetStatus = this.text.match("ethernet") ? true : false;
      }
    }
  }

  Process {
    id: checkWifi
    running: false
    command: ["sh", "-c", "nmcli c show --active | grep wifi"]
    stdout: StdioCollector {
      onStreamFinished: {
        network.wifiStatus = this.text.match("wifi") ? true : false;
      }
    }
  }

  function updateNetworkStatus() {
    checkEthernet.running = true;
    checkWifi.running = true;
    connectionStatus();
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: updateNetworkStatus()
  }

  function connectionStatus() {
    if (network.ethernetStatus) {
      network.icon = "󰈀"
    } else if (network.wifiStatus) {
      network.icon = ""
    } else {
      network.icon = "󰌙"
    }
  }

  Rectangle {
    color: "transparent"
    implicitWidth: 30
    implicitHeight: 30

    Text {
      text: network.icon
      color: "#ebdbb2"
      font.pointSize: 12
      font.family: "RecMono Linear Nerd Font"
    }
  }
}
