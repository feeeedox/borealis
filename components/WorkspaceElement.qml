
import QtQuick
import qs.theme

Item {
    id: root

    property int number: 1
    property bool isActive: false

    implicitWidth: 48
    implicitHeight: 32

    Text {
        anchors.centerIn: parent

        text: root.number.toString()
        font.pixelSize: root.isActive ? 20 : 16
        font.family: "Bricolage Grotesque"
        font.features: { "tnum": 1 }
        font.weight: 500

        color: root.isActive
            ? Colors.primary
            : Colors.onSurfaceVariant

        opacity: root.isActive ? 1 : 0.55

        Behavior on font.pixelSize {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
    }

    Rectangle {
        anchors.right: parent.right
        anchors.rightMargin: -8
        anchors.verticalCenter: parent.verticalCenter

        width: root.isActive ? 18 : 14
        height: 2
        color: root.isActive
            ? Colors.primary
            : Qt.alpha(Colors.outlineVariant, 0.5)

        Behavior on width {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
    }
}
