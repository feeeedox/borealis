// Hyprland-Workspaces. Klick wechselt den Workspace.
import QtQuick
import Quickshell.Hyprland
import qs.theme

Column {
    spacing: 6

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            id: ws
            required property var modelData   // der Workspace

            visible: modelData.id > 0         // Special-Workspaces ausblenden
            width: modelData.focused ? 32 : 24
            height: 22
            radius: Style.radius
            color: modelData.focused ? Colors.primary : Colors.surfaceContainer

            Behavior on width { NumberAnimation { duration: 150 } }
            Behavior on color { ColorAnimation { duration: 150 } }

            Text {
                anchors.centerIn: parent
                text: ws.modelData.id
                color: ws.modelData.focused ? Colors.primaryText : Colors.foregroundDim
                font.family: Style.fontFamily
                font.pixelSize: Style.fontSize
            }

            MouseArea {
                anchors.fill: parent
                onClicked: ws.modelData.activate()
            }
        }
    }
}
