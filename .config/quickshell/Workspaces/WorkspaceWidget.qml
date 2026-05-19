import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Hyprland

import ".."

Rectangle {
    readonly property int workspaces: 6
    readonly property int space: 12
    readonly property int smallSize: 8
    readonly property int bigSize: 12

    implicitHeight: 24
    implicitWidth: (space + smallSize) * workspaces + space

    color: RosePine.overlay
    radius: 5

    RowLayout {
        anchors {
            centerIn: parent
            // fill: parent
            leftMargin: space
        }
        spacing: 2

        Repeater {
            model: workspaces
            Item {
                Layout.preferredHeight: 18
                Layout.preferredWidth:  18
                Layout.alignment: Qt.AlignCenter


                Rectangle {
                    id: wsCircle
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    property var isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                    anchors.centerIn: parent

                    implicitHeight: isActive ? bigSize : smallSize
                    implicitWidth: isActive ? bigSize : smallSize

                    radius: smallSize

                    color: isActive ? RosePine.gold : (ws ? RosePine.foam : RosePine.subtle)

                    Behavior on implicitWidth {
                        NumberAnimation {
                            easing.type: Easing.OutBack
                            duration: 150
                        }
                    }

                    Behavior on implicitHeight {
                        NumberAnimation {
                            easing.type: Easing.OutBack
                            duration: 150
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onReleased: {
                        if (wsCircle.isActive)
                            return

                        Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + "})")
                    }
                }
            }
        }
    }
}
