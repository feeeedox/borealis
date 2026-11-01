
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [root.sink].filter(s => s !== null)
    }

    readonly property bool available: sink !== null
    readonly property bool muted: sink?.audio?.muted ?? false
    readonly property real volume: sink?.audio?.volume ?? 0

    readonly property real value: muted ? 0 : Math.min(1, volume)

    function setVolume(value) {
        if (!sink?.audio) return
        sink.audio.volume = Math.max(0, Math.min(1, value))
    }

    function toggleMute() {
        if (!sink?.audio) return
        sink.audio.muted = !sink.audio.muted
    }
}
  