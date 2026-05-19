import QtQuick
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland

import ".."

Rectangle {
    id: session
    required property PanelWindow bar
    required property color bgPopup
    required property color bgMenu

    height: 24
    width: 24
    color: RosePine.rose

    radius: 5

    // state: "NORMAL"

    // states: [
    //     State {
    //         name: "NORMAL"
    //         PropertyChanges { target: session; color: bgMenu }
    //     },
    //     State {
    //         name: "HOVERED"
    //         PropertyChanges { target: session; color: Nordic.gray1 }
    //     },
    //     State {
    //         name: "PRESSED"
    //         PropertyChanges { target: session; color: Nordic.gray2 }
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
    //         to: "PRESSED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
    //     },
    //     Transition {
    //         from: "PRESSED"
    //         to: "HOVERED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
    //     }
    // ]

    // 󰣇
    // IconImage {
    //     anchors.centerIn: parent

    //     implicitSize: 14
    //     source: Quickshell.iconPath("/home/alex/.config/quickshell/archlinux-icon-crystal-256.svg")

    //     // layer.enabled: true
    //     // layer.effect: MultiEffect {
    //     //     colorization: 1.0
    //     //     colorizationColor: RosePine.love
    //     // }
    // }

    Text {
        anchors.centerIn: parent

        color: RosePine.overlay
        text: "󰣇"
        font {
            family: "JetBrainsMonoNL Nerd Font Propo"
            pixelSize: 16
            // bold: true
            // hintingPreference: Font.PreferVerticalHinting
        }
    }


    property bool content_loaded: false
    property bool content_visible: false

    Timer {
        id: t
        interval: 200
        onTriggered: session.content_loaded = false
    }

    function toggle_popup() {
        if (session.content_visible)
        t.restart()
        else {
            session.content_loaded = true
            t.stop()
        }
        session.content_visible = !session.content_visible
    }

    MouseArea {
        id: icon_area
        anchors.fill: parent
        // hoverEnabled: true
        // onEntered: parent.state = "HOVERED"
        // onExited:  parent.state = "NORMAL"
        // onPressed: parent.state = "PRESSED"

        onReleased: { 
            // parent.state = containsMouse ? "HOVERED" : "NORMAL"
            toggle_popup()
        }
    }


    LazyLoader {
        active: session.content_loaded 

        // loading: true

        PanelWindow {
            id: popup

            color: "transparent"

            implicitWidth: 300
            implicitHeight: 300

            exclusionMode: ExclusionMode.Ignore
            anchors {
                top: true
                right: true
            }

            margins {
                top: bar.height + 5
                right: session.content_visible ? 5 : - implicitWidth - 50
            }

            Behavior on margins.right { 
                NumberAnimation {
                    duration: 30
                    easing.type: Easing.InOutQuint
                    // easing.overshoot: 3
                } 
            }

            Rectangle {
                id: content
                anchors.fill: parent
                anchors.centerIn: parent

                implicitWidth: 300
                implicitHeight: 300


                radius: 5
                color: bgMenu

                border {
                    color: bgPopup
                    width: 5
                }

                Entries {
                    clip: true
                    anchors {
                        fill: parent
                        topMargin: 5
                        bottomMargin: 5
                    }
                }
            }
        }
    }
}
