
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property var device: UPower.displayDevice

    readonly property bool available:
        device.ready && device.isLaptopBattery

    readonly property real level:
        available ? device.percentage : 0

    readonly property bool onBattery: UPower.onBattery
}
  