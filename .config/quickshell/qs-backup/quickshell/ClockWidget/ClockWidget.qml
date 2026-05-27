import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
    id: time_root
    readonly property color fg: RosePine.rose

    antialiasing: true
    color: RosePine.overlay
    height: 24
    width: 210
    radius: 5

    RowLayout {
        anchors {
            fill: parent
            centerIn: parent
        }
        // spacing: 0

        Item {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.preferredHeight: time_root.height
            Layout.preferredWidth: time_text.width
            Layout.leftMargin: 10
            Layout.rightMargin: 1

            Text {
                id: time_text
                anchors.centerIn: parent
                color: fg

                text: Time.time

                font {
                    family: "JetBrainsMonoNL Nerd Font Propo"
                    pixelSize: 15
                    // bold: true
                    // hintingPreference: Font.PreferVerticalHinting
                }

                renderType: Text.QtRendering
            }
        }

        Separator {
            Layout.alignment: Qt.AlignCenter
        }

        Item {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredHeight: time_root.height
            Layout.preferredWidth: date_text.width
            Layout.rightMargin: 10
            Text {
                id: date_text
                anchors.centerIn: parent
                color: fg

                text: Time.date

                font {
                    family: "JetBrainsMonoNL Nerd Font Propo"
                    pixelSize: 15
                    // bold: true
                    // hintingPreference: Font.PreferVerticalHinting
                }

                renderType: Text.QtRendering
            }
        }
    }
}
