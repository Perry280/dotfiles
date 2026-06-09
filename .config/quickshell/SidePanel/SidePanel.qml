import QtQuick

import Quickshell
import Quickshell.Hyprland

import ".."

LazyLoader {
    required property var timer
    id: loader

    PanelWindow {
        id: popup

        color: "transparent"

        implicitWidth: 400
        implicitHeight: screen.height - Style.barHeight - 2 * Style.gaps

        anchors {
            top: true
            // bottom: true
            // left: true
            right: true
        }

        margins {
            top: Style.barHeight + Style.gaps
            right: Style.gaps
        }

        // focusable: true
        exclusionMode: ExclusionMode.Ignore
        // HyprlandFocusGrab {
        //     id: focusGrab
        //     windows: [popup]
        //     active: true
        //     onCleared: loader.active = false
        // }
    
        // MouseArea {
        //     anchors.fill: parent
        //     propagateComposedEvents: true
        //     preventStealing: true
        //     onClicked: loader.active = false
        // }
        HoverHandler {
            id: hover
            parent: parent
            onHoveredChanged: {
                if (hovered) {
                    loader.active = true
                    timer.stop()
                }
                else {
                    timer.restart()
                }
            }
        }

        Rectangle {
            id: content
            anchors.fill: parent

            // anchors {
            //     top: parent.top
            //     right: parent.right
            //     topMargin: 34 + 5
            //     rightMargin: 5
            // }

            // implicitWidth: 300
            // implicitHeight: screen.height - anchors.topMargin - 5

            radius: 10
            color: Style.colors.bgMain

            border {
                width: 5
                color: Style.colors.bgAlt
            }

            focus: true
            Keys.onPressed: (event) => {
                loader.active = false
            }

            // Entries {
            //     clip: true
            //     anchors {
            //         fill: parent
            //         topMargin: 5
            //         bottomMargin: 5
            //     }
            // }
        }
    }
}
