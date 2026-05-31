pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

// DwlService for MangoWC
Singleton {
    id: root

    property bool dwlAvailable: false
    property var outputs: ""
    property var clients: ""
    property string activeTag: ""

    signal stateChanged()

    Component.onCompleted: {
        checkMangoWC()
    }

    // Timer to poll MangoWC state - faster polling for better responsiveness
    Timer {
        interval: 100  // Poll every 100ms for quick updates
        running: root.dwlAvailable
        repeat: true
        onTriggered: root.getTagState()
    }

    // Check if MangoWC is running
    Process {
        id: checkProcess
        command: ["pgrep", "-x", "mango"]
        running: false

        onExited: exitCode => {
            const wasAvailable = dwlAvailable
            dwlAvailable = (exitCode === 0)
            
            if (dwlAvailable && !wasAvailable) {
                getTagState()
            } else if (!dwlAvailable && wasAvailable) {
                outputs = {}
                stateChanged()
            }
        }
    }

    // Get tag state using mmsg -g -t -l (tags + layout)
    Process {
        id: tagStateProcess
        command: ["sh", "-c", "mmsg get tags DP-1"]
        running: false

        property var lineBuffer: []

        stdout: SplitParser {
            onRead: data => {
                tagStateProcess.lineBuffer.push(data)
            }
        }

        onExited: exitCode => {
            if (exitCode === 0 && tagStateProcess.lineBuffer.length > 0) {
                root.outputs = tagStateProcess.lineBuffer.join()
                root.outputs = root.outputs.replace(/\D/g, "")
                root.outputs = root.outputs.slice(1, root.outputs.length)
                parseTagOutput()
            }
            tagStateProcess.lineBuffer = []
        }
    }

    function parseTagOutput() {
        try {
            root.activeTag = root.outputs[root.outputs.length - 1]
            root.clients = ""
            for (var i = 0; i < root.outputs.length-1; i++){
              if ((i+1) % 2 === 0) {
                root.clients = root.clients.concat(root.outputs[i])
              }
            }
            stateChanged()
        } catch (e) {
            // Silent
        }
    }

    function checkMangoWC() {
        checkProcess.running = true
    }

    function getTagState() {
        if (dwlAvailable) {
            tagStateProcess.running = true
        }
    }

    function switchToTag(process) {
        if (!dwlAvailable) return
        process.startDetached()
        refreshTimer.restart()
    }

    // Refresh state after commands
    Timer {
        id: refreshTimer
        interval: 100
        onTriggered: root.getTagState()
    }

    // Periodic check if MangoWC is still running
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            if (!root.dwlAvailable) {
                root.checkMangoWC()
            }
        }
    }
}
