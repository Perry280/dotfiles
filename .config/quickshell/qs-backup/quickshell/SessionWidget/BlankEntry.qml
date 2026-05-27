import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

import ".."

Rectangle {
    id: blank
    required property string textEntry
    required property string iconEntry
    required property color iconColor
    required property var command

    implicitHeight: 40
    radius: 5

    color: Nordic.gray0

    state: "NORMAL"

    states: [
        State {
            name: "NORMAL"
            PropertyChanges { target: blank; color: RosePine.overlay }
        },
        State {
            name: "HOVERED"
            PropertyChanges { target: blank; color: RosePine.highlight_med }
        },
        State {
            name: "PRESSED"
            PropertyChanges { target: blank; color: RosePine.highlight_high }
        },
    ]

    transitions: [
        Transition {
            from: "NORMAL"
            to: "HOVERED"
            ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
        },
        Transition {
            from: "HOVERED"
            to: "NORMAL"
            ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
        },
        Transition {
            from: "HOVERED"
            to: "PRESSED"
            ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
        },
        Transition {
            from: "PRESSED"
            to: "HOVERED"
            ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        // propagateComposedEvents: true
        onEntered: {
            parent.state = "HOVERED"
        }
        onExited: {
            parent.state = "NORMAL"
        }
        onReleased: {
            Quickshell.execDetached(command)
        }
    }

    RowLayout {
        id: row
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
        }
        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            color: RosePine.text
            text: textEntry
            font {
                family: "JetBrainsMonoNL Nerd Font Propo"
                pixelSize: 26
                // bold: true
                // hintingPreference: Font.PreferVerticalHinting
            }
        }

        Rectangle {
            implicitWidth: 26
            implicitHeight: implicitWidth
            radius: implicitWidth

            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            color: iconColor

            IconImage {
                anchors.centerIn: parent

                source: Quickshell.iconPath(iconEntry)
                implicitSize: 20

                layer.enabled: true
                layer.effect: MultiEffect {
                    colorization: 1.0
                    colorizationColor: RosePine.overlay
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Quickshell.execDetached(command)
                }
            }
        }
    }
}
