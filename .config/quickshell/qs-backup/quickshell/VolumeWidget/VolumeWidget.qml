import QtQuick
import QtQuick.Layouts

import Quickshell

import ".."

Rectangle { 
    id: vol
    readonly property color fgVolumeWidget: RosePine.overlay


    height: 24
    width: vol_main.width + 20
    color: RosePine.foam

    radius: 5
    antialiasing: true
    
    RowLayout { 
        id: vol_main
        anchors.centerIn: parent
        spacing: 10

        VolumeIcon {
            Layout.preferredHeight: 24
            Layout.preferredWidth: 20

            fg: fgVolumeWidget
            Layout.alignment: Qt.AlignVCenter
        }
        VolumeText {
            Layout.preferredHeight: 24
            Layout.preferredWidth: 20
            Layout.rightMargin: 5

            fg: fgVolumeWidget
            Layout.alignment: Qt.AlignVCenter
        }
    }

    // state: "NORMAL"

    // states: [
    //     State {
    //         name: "NORMAL"
    //         PropertyChanges { target: vol; color: bg }
    //     },
    //     State {
    //         name: "HOVERED"
    //         PropertyChanges { target: vol; color: RosePine.highlight_med }
    //     },
    //     State {
    //         name: "CLICKED"
    //         PropertyChanges { target: vol; color: RosePine.highlight_high }
    //     },
    // ]

    // states: [
    //     State {
    //         name: "NORMAL"
    //         PropertyChanges {
    //             target: vol
    //             border {
    //                 color: RosePine.overlay
    //                 width: 0
    //             }
    //         }
    //     },
    //     State {
    //         name: "HOVERED"
    //         PropertyChanges {
    //             target: vol
    //             border {
    //                 color: RosePine.overlay
    //                 width: 1
    //             }
    //         }
    //     },
    //     State {
    //         name: "CLICKED"
    //         PropertyChanges {
    //             target: vol
    //             border {
    //                 color: RosePine.overlay
    //                 width: 2
    //             }
    //         }
    //     },
    // ]

    // transitions: [
    //     Transition {
    //         from: "NORMAL"
    //         to: "HOVERED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
    //     },
    //     Transition {
    //         from: "HOVERED"
    //         to: "NORMAL"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
    //     },
    //     Transition {
    //         from: "HOVERED"
    //         to: "CLICKED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
    //     },
    //     Transition {
    //         from: "CLICKED"
    //         to: "HOVERED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
    //     }
    // ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.state = "HOVERED"
        }
        onExited: {
            parent.state = "NORMAL"
        }
        onPressed: {
            parent.state = "CLICKED"
        }
        onReleased: {
            parent.state = containsMouse ? "HOVERED" : "NORMAL"
            Quickshell.execDetached(["pavucontrol"])
        }
    }
}
