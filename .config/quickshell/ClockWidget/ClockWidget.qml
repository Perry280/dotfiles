import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
    id: time_root
    readonly property color fg: RosePine.rose

    antialiasing: true
    color: RosePine.overlay
    height: 24
    width: 70
    radius: 5

    Item {
        anchors {
            fill: parent
            centerIn: parent
        }

        Text {
            id: time_text
            anchors.centerIn: parent
            color: fg

            text: Time.time

            font {
                family: "JetBrainsMonoNL Nerd Font Propo"
                pixelSize: 15
            }

            renderType: Text.QtRendering
        }
    }

    MouseArea {
        id: triggerArea
        anchors.fill: parent
        onClicked: {
            calendar.active = !calendar.active
        }
    }

    CalendarWidget {
        id: calendar
        active: false
    }
}
