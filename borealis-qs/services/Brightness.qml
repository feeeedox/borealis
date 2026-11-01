
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property real value: 0
    property bool available: false

    function refresh() {
        if (!brightnessProcess.running)
            brightnessProcess.running = true
    }

    Process {
        id: brightnessProcess
        command: ["brightnessctl", "-m"]

        stdout: StdioCollector {
            onStreamFinished: {
                const parts = text.trim().split(",")
                const percent = parseFloat(parts[4])

                if (!isNaN(percent)) {
                    root.value = percent / 100
                    root.available = true
                } else {
                    root.available = false
                }
            }
        }

        onExited: (exitCode, exitStatus) => {
            if (exitCode !== 0)
                root.available = false
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: root.refresh()
    }
}
  