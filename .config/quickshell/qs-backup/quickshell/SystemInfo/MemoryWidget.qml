import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

import ".."

RowLayout {
    spacing: 5

    readonly property color fg: RosePine.overlay // RosePine.iris

    Item {
        Layout.preferredHeight: 24
        Layout.preferredWidth: 20

        IconImage {
            anchors.centerIn: parent

            implicitSize: 20
            source: Quickshell.iconPath("indicator-sensors-memory")

            layer.enabled: true
            layer.effect: MultiEffect {
                colorization: 1.0
                colorizationColor: fg
            }
        }
    }

    Item {
        Layout.preferredHeight: 24
        Layout.preferredWidth: text.width

        Text {
            id: text
            anchors.centerIn: parent

            color: fg
            font {
                family: "JetBrainsMonoNL Nerd Font Propo"
                pixelSize: 15
                // bold: true
                // hintingPreference: Font.PreferVerticalHinting
            }

            renderType: Text.QtRendering

            // text: SysInfo.usedMemPercentage + "%"
            text: SysInfo.usedMem + "/" + SysInfo.totalMem
        }   
    }
}
