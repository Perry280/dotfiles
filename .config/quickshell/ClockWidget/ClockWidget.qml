import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
    id: time_root

    antialiasing: true
    color: Style.colors.bgWidget
    height: Style.widgetHeight
    width: 60
    radius: 5

    Item {
        anchors {
            fill: parent
            centerIn: parent
        }

        Text {
            id: time_text
            anchors.centerIn: parent
            color: RosePine.rose

            text: Time.time

            font {
                family: Style.fontfamily
                pixelSize: Style.fontsize
            }

            renderType: Text.QtRendering
        }
    }

    // MouseArea {
    //     id: triggerArea
    //     anchors.fill: parent
    //     onClicked: {
    //         calendar.active = !calendar.active
    //     }
    // }
    Timer {
        id: t
        interval: 200
        running: false
        repeat: true
        onTriggered: calendar.active = false
    }

    HoverHandler {
        id: hover
        parent: parent
        onHoveredChanged: {
            if (hovered) {
                calendar.active = true
                t.stop()
            }
            else {
                t.restart()
            }
        }
    }

    CalendarWidget {
        id: calendar
        active: false
        timer: t
    }
}
