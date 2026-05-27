import QtQuick
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

Item {
    required property color fg

    IconImage {
        anchors.centerIn: parent

        implicitSize: 20
        source: Quickshell.iconPath(Volume.get_icon())

        layer.enabled: true
        layer.effect: MultiEffect {
            colorization: 1.0
            colorizationColor: fg
        }

    }
}

