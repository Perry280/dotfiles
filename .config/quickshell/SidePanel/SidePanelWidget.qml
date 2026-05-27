import QtQuick
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

import ".."

Rectangle {
    id: session
    height: 24
    width: 24
    color: RosePine.rose // RosePine.gold

    radius: 5

    Text {
        anchors.centerIn: parent

        color: RosePine.overlay
        text: "󰣇"
        font {
            family: "JetBrainsMonoNL Nerd Font Propo"
            pixelSize: 16
        }
    }

    MouseArea {
        id: icon_area
        anchors.fill: parent

        onClicked: { 
            sidePanel.active = !sidePanel.active
        }
    }

    SidePanel {
        id: sidePanel
        active: false
    }
}
