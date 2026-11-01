
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.theme
import qs.modules

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

    implicitWidth: Style.barHeight
    color: Qt.alpha(Colors.surface, 0.78)

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: Style.padding
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: Style.spacing

        Workspaces {}
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: Style.spacing

        Text {
            text: "Borealis"
            color: Colors.primary
        }
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
