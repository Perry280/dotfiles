import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

import ".."

RowLayout {
    spacing: 5

    readonly property color fg: Style.colors.fgAlt // RosePine.love
    readonly property int widgetHeight: Style.widgetHeight // RosePine.love

    Item {
        Layout.preferredHeight: widgetHeight
        Layout.preferredWidth: 20
        Layout.alignment: Qt.AlignCenter

        IconImage {
            anchors.centerIn: parent

            implicitSize: 20
            source: Quickshell.iconPath("indicator-sensors-cpu")

            layer.enabled: true
            layer.effect: MultiEffect {
                colorization: 1.0
                colorizationColor: fg
            }
        }
    }

    Item {
        Layout.preferredHeight: widgetHeight
        Layout.preferredWidth: 20
        Layout.alignment: Qt.AlignCenter

        Text {
            anchors.centerIn: parent

            color: fg
            font {
                family: Style.fontfamily
                pixelSize: Style.fontsize
                // bold: true
                // hintingPreference: Font.PreferVerticalHinting
            }

            renderType: Text.QtRendering

            text: SysInfo.cpuUsagePercentage + "%"
        }   
    }
}
