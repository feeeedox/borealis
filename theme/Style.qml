pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property int barWidth: 64
    readonly property int spacing: 8
    readonly property int padding: 12
    readonly property int radius: 10

    readonly property string fontFamily: "sans-serif"
    readonly property int fontSize: 13

    readonly property QtObject bar: QtObject {
        readonly property int spacing: 32
    }

    readonly property QtObject clock: QtObject {
        readonly property string fontFamily: "Bricolage Grotesque"
        readonly property int fontSize: 34
        readonly property int fontWeight: 600
        readonly property int radius: 8
    }

}
