import QtQuick
import QtQuick.Layouts
import Quickshell // for PanelWindow
import Quickshell.Wayland 

import "./SystemInfo"
import "./Workspaces"

import "./ClockWidget"

import "./MediaPlayer"
import "./NetworkWidget"
import "./VolumeWidget"
import "./SidePanel"

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
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

                RowLayout{
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                        rightMargin: 20
                    }

                    MediaPlayerWidget {
                        Layout.alignment: Qt.AlignCenter
                        id: mp
                    }

                    Rectangle {
                        Layout.alignment: Qt.AlignCenter

                        implicitHeight: 24
                        implicitWidth: nw.width + vol.width + session.width
                        radius: 5
                        color: RosePine.overlay

                        RowLayout {
                            id: rightElements
                            anchors {
                                centerIn: parent
                                fill: parent
                            }

                            NetworkWidget {
                                Layout.leftMargin: 5
                                Layout.alignment: Qt.AlignCenter
                                id: nw
                            }

                            VolumeWidget {
                                Layout.alignment: Qt.AlignCenter
                                id: vol
                            }

                            SidePanelWidget {
                                Layout.alignment: Qt.AlignCenter
                                id: session
                            }
                        }
                    }
                }
            }
        }
    }
}
