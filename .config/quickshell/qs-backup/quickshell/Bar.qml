import QtQuick
import QtQuick.Layouts
import Quickshell // for PanelWindow
import Quickshell.Wayland 

import "./ClockWidget"

import "./VolumeWidget"
import "./SessionWidget"
import "./NetworkWidget"
import "./MediaPlayer"

import "./Workspaces"
import "./SystemInfo"

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            property color bgWidget: RosePine.overlay
            screen: modelData

            implicitHeight: 34
            anchors {
                top: true
                left: true
                right: true
            }

            surfaceFormat.opaque: true

            color: "transparent"

            Rectangle {
                id: root

                anchors.fill: parent

                color: RosePine.base


                RowLayout {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 2
                    }

                    SystemInfoWidget {}

                    WorkspaceWidget {}
                }

                ClockWidget {
                    anchors.centerIn: parent
                }

                RowLayout {
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                        rightMargin: 2
                    }

                    MediaPlayerWidget {}

                    NetworkWidget {}

                    VolumeWidget {}

                    SessionWidget {
                        bar: bar
                        bgPopup: root.color
                        bgMenu: bgWidget
                    }
                }
            }
        }
    }
}
