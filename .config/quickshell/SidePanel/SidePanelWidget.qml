import QtQuick
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

import ".."

Rectangle {
    id: session
    height: Style.widgetHeight
    width: Style.widgetHeight
    color: RosePine.rose // RosePine.gold

    radius: 5

    Text {
        anchors.centerIn: parent

        color: Style.colors.fgAlt
        text: "󰣇"
        font {
            family: Style.fontfamily
            pixelSize: 16
        }
    }

    // MouseArea {
    //     id: icon_area
    //     anchors.fill: parent
    //     onClicked: sidePanel.active = !sidePanel.active
    // }
    
    Timer {
        id: t
        interval: 200
        running: false
        repeat: true
        onTriggered: sidePanel.active = false
    }

    HoverHandler {
        id: hover
        parent: parent
        onHoveredChanged: {
            if (hovered) {
                sidePanel.active = true
                t.stop()
            }
            else {
                t.restart()
            }
        }
    }

    SidePanel {
        id: sidePanel
        active: false
        timer: t
    }
}
