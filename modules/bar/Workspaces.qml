
import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.theme
import qs.components

Column {
    id: root

    required property var targetScreen

    width: 48
    spacing: 18

    readonly property int workspaceCount: 5

    readonly property bool isRightMonitor:
        Quickshell.screens.some(
            screen => screen.x < root.targetScreen.x
        )

    readonly property int workspaceStart:
        isRightMonitor ? 6 : 1

    readonly property var monitor:
        Hyprland.monitorFor(root.targetScreen)

    Repeater {
        model: root.workspaceCount

        WorkspaceElement {
            id: workspace

            required property int index

            readonly property int workspaceId:
                root.workspaceStart + index

            number: workspaceId

            isActive:
                root.monitor?.activeWorkspace?.id === workspaceId

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    Hyprland.dispatch(
                        'hl.dsp.focus({ workspace = "' +
                        workspace.workspaceId + '" })'
                    )
                }
            }
        }
    }
}
