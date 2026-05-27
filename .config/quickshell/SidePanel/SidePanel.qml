import QtQuick

import Quickshell

import ".."

LazyLoader {
    id: loader
    active: false

    PanelWindow {
        id: popup

        color: "transparent"

        // implicitWidth: 300
        // implicitHeight: 300

        focusable: true
        exclusionMode: ExclusionMode.Ignore
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        // margins {
        //     top: 34 + 5
        //     right: 5
        // }

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            preventStealing: true
            onClicked: loader.active = false
        }

        Rectangle {
            id: content

            anchors {
                top: parent.top
                right: parent.right
                topMargin: 34 + 5
                rightMargin: 5
            }

            implicitWidth: 300
            implicitHeight: screen.height - anchors.topMargin - 5

            radius: 10
            color: RosePine.base

            border {
                width: 5
                color: RosePine._nc
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
