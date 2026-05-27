import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
    id: sys_info

    color: RosePine.love
    implicitHeight: 24
    implicitWidth: 250
    radius: 5

    RowLayout {
        anchors.centerIn: parent
        anchors.fill: parent
        spacing: 10

        Item {
            Layout.preferredHeight: 24
            Layout.preferredWidth:  20
            Layout.alignment: Qt.AlignCenter

            Layout.leftMargin: 10

            TempWidget {
                id: tempWidget
                anchors.centerIn: parent
            }
        }

        Separator {
            Layout.alignment: Qt.AlignCenter
            Layout.leftMargin: 10
        }

        Item {
            Layout.preferredHeight: 24
            Layout.preferredWidth:  10
            Layout.alignment: Qt.AlignCenter

            Layout.leftMargin: 10

            CPUWidget {
                id: cpuWidget
                anchors.centerIn: parent
            }
        }

        Separator {
            Layout.alignment: Qt.AlignCenter
            Layout.leftMargin: 10
        }

        Item {
            Layout.preferredHeight: 24
            Layout.preferredWidth:  40
            Layout.alignment: Qt.AlignCenter

            Layout.leftMargin: 2
            Layout.rightMargin: 20

            MemoryWidget {
                id: memWidget
                anchors.centerIn: parent
            }
        }
    }
}
