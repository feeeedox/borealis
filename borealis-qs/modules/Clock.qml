import QtQuick
import Quickshell
import qs.theme

Column {
    spacing: 6

    Text {
        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }

        text: Qt.formatDateTime(clock.date, "hh\nmm AP").replace(/ (AM|PM)$/, "")
        color: Colors.foreground

        font.family: Style.clock.fontFamily
        font.weight: Font.DemiBold
        font.variableAxes: { "wdth": 75 }
        font.pixelSize: Style.clock.fontSize
        font.features: { "tnum": 1 }
        font.bold: true
        

        lineHeight: 0.85
        lineHeightMode: Text.ProportionalHeight
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        text: clock.date.getHours() >= 12 ? "PM" : "AM"
        color: Colors.onSurfaceVariant
        font.family: Style.clock.fontFamily
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }


}
