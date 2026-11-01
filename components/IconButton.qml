
import QtQuick
import QtQuick.Effects
import qs.theme

Rectangle {
    id: root

    property url icon: ""
    property color iconColor: Colors.foreground
    property int iconSize: 28

    signal clicked()

    implicitWidth: 36
    implicitHeight: 36
    radius: Style.radius

    color: "transparent"

    Image {
        id: svgIcon

        anchors.centerIn: parent
        width: root.iconSize
        height: root.iconSize

        source: root.icon
        sourceSize: Qt.size(root.iconSize, root.iconSize)
        fillMode: Image.PreserveAspectFit

        visible: false
    }

    Rectangle {
        id: tintSource

        anchors.fill: svgIcon
        color: root.iconColor
        visible: false
    }

    MultiEffect {
        anchors.fill: svgIcon
        source: svgIcon

        colorization: 1
        colorizationColor: root.iconColor
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: root.clicked()
    }

    Behavior on color {
        ColorAnimation {
            duration: 150
        }
    }
}