import QtQuick
import qs.theme

Rectangle {
    id: root

    property real value: 0.75 
    property color fillColor: Colors.primary
    property color backgroundColor: Colors.surfaceContainerHigh
    property int barWidth: 4
    property int barHeight: 77 

    width: barWidth
    height: barHeight
    radius: Style.radius
    color: backgroundColor

    Rectangle {
        width: parent.width
        height: parent.height * Math.max(0, Math.min(1, root.value))
        radius: Style.radius
        color: root.fillColor

        anchors.bottom: parent.bottom

        Behavior on height {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
    }
}