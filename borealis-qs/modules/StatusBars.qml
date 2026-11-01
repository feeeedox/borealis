import QtQuick
import Quickshell
import qs.theme
import qs.components
import qs.services

Row {

    readonly property int brightness: 60
    readonly property int volume: 80
    readonly property int battery: 50

    spacing: 7

    // Brightness
    StatusBar {
        value: Brightness.value
        visible: Brightness.available
    }

    // Volume
    StatusBar {
        value: Audio.value
    }

    // Battery
    StatusBar {
        // visible: Battery.available
        value: Battery.level
    }
}