
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.theme
import qs.components
import qs.services
 
PanelWindow {
    id: bar

    required property var modelData
    screen: modelData

    WlrLayershell.namespace: "borealis-bar"

    anchors {
        top: true
        bottom: true
        left: true
    }

    implicitWidth: Style.barWidth
    color: Qt.alpha(Colors.surface, 0.78)

    Rectangle {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        width: 1
        color: Qt.alpha(Colors.outlineVariant, 0.5)
    }


    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: Style.padding
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Style.bar.spacing

        IconButton {
            Layout.alignment: Qt.AlignHCenter
            icon: "../assets/icons/arch-linux.svg"
            iconColor: Colors.primary
            onClicked: {
                console.log("todo: open app launcher")
            }
        }

        Workspaces {
            Layout.fillWidth: true
            targetScreen: bar.screen
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: Style.spacing
    }

    ColumnLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Style.padding + 16
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 24

        Clock {}
        StatusBars {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
