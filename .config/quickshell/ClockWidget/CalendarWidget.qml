import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Quickshell
import Quickshell.Hyprland

import ".."

LazyLoader {
    id: loader

    PanelWindow {
        id: calendarWindow
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        // implicitHeight: 300
        // implicitWidth: 300
        color: "transparent"

        // margins {
        //     top: 34 + 5
        // }
        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            preventStealing: true
            onClicked: loader.active = false
        }

        focusable: true
        // HyprlandFocusGrab {
        //     id: focusGrab
        //     windows: [calendarWindow]
        //     active: true
        //     onCleared: loader.active = false
        // }
        // mask: Region {
        //     item: calendarRect
        // //     intersection: Intersection.Intersect // Do NOT use Intersect
        // }
        exclusionMode: ExclusionMode.Ignore

        property int month_offset: 0
        function to_prev_month() {
            var prev_month = grid.month - 1
            month_offset--
            months.text = Time.get_month_with_offset(month_offset)
            if (prev_month == -1)
                grid.month = 11
            else
                grid.month = prev_month
        }
        function to_next_month() {
            var next_month = grid.month + 1
            month_offset++
            months.text = Time.get_month_with_offset(month_offset)
            if (next_month == 12)
                grid.month = 0
            else
                grid.month = next_month
        }
        
        Rectangle {
            id: calendarRect
            anchors {
                top: parent.top
                right: parent.right
                topMargin: 34 + 5
                rightMargin: screen.width / 2 - implicitWidth / 2
            }

            implicitWidth: 300
            implicitHeight: 300
            radius: 10
            color: RosePine.base
            border {
                width: 5
                color: RosePine._nc
            }

            focus: true
            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Left)
                    to_prev_month()
                else if (event.key === Qt.Key_Right)
                    to_next_month()
                else
                    loader.active = false
            }

            ColumnLayout {
                anchors {
                    centerIn: parent
                    fill: parent
                }

                RowLayout {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 20
                    // spacing: 20

                    Rectangle {
                        id: backwardRect
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

                        implicitHeight: months.height + 6
                        implicitWidth: backward.width + 20
                        radius: 5
                        color: RosePine.overlay
                        Text {
                            id: backward
                            anchors.centerIn: parent
                            color: RosePine.rose

                            text: "<"

                            font {
                                family: "JetBrainsMonoNL Nerd Font Propo"
                                pixelSize: 15
                            }

                            renderType: Text.QtRendering
                        }


                        state: "NORMAL"

                        states: [
                            State {
                                name: "NORMAL"
                                PropertyChanges { target: backwardRect; color: RosePine.overlay }
                            },
                            State {
                                name: "CLICKED"
                                PropertyChanges { target: backwardRect; color: RosePine.highlight_med }
                            },
                        ]

                        transitions: [
                            Transition {
                                from: "NORMAL"
                                to: "CLICKED"
                                ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
                            },
                            Transition {
                                from: "CLICKED"
                                to: "NORMAL"
                                ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
                            }
                        ]

                        MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                parent.state = "CLICKED"
                            }
                            onReleased: {
                                parent.state = "NORMAL"
                            }
                            onClicked: to_prev_month()
                        }
                    }

                    Rectangle {
                        Layout.alignment: Qt.AlignCenter

                        implicitHeight: months.height + 6
                        implicitWidth: 100
                        radius: 5

                        color: RosePine.overlay

                        Text {
                            id: months
                            anchors.centerIn: parent
                            color: RosePine.rose

                            text: Time.month_year_string

                            font {
                                family: "JetBrainsMonoNL Nerd Font Propo"
                                pixelSize: 15
                            }

                            renderType: Text.QtRendering
                        }
                    }
                    Rectangle {
                        id: forwardRect
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignRight

                        implicitHeight: months.height + 6
                        implicitWidth: forward.width + 20
                        radius: 5
                        color: RosePine.overlay
                        Text {
                            id: forward
                            anchors.centerIn: parent
                            color: RosePine.rose

                            text: ">"

                            font {
                                family: "JetBrainsMonoNL Nerd Font Propo"
                                pixelSize: 15
                            }

                            renderType: Text.QtRendering
                        }

                        state: "NORMAL"

                        states: [
                            State {
                                name: "NORMAL"
                                PropertyChanges { target: forwardRect; color: RosePine.overlay }
                            },
                            State {
                                name: "CLICKED"
                                PropertyChanges { target: forwardRect; color: RosePine.highlight_med }
                            },
                        ]

                        transitions: [
                            Transition {
                                from: "NORMAL"
                                to: "CLICKED"
                                ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
                            },
                            Transition {
                                from: "CLICKED"
                                to: "NORMAL"
                                ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
                            }
                        ]

                        MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                parent.state = "CLICKED"
                            }
                            onReleased: {
                                parent.state = "NORMAL"
                            }
                            onClicked: to_next_month()
                        }
                    }

                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignCenter
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    implicitHeight: days.height
                    implicitWidth: days.width
                    radius: 5

                    color: RosePine.overlay
                    DayOfWeekRow {
                        id: days
                        anchors {
                            centerIn: parent
                            fill: parent
                        }

                        locale: grid.locale

                        delegate: Text {
                            required property string narrowName

                            text: narrowName
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter

                            color: RosePine.rose
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignCenter

                    Layout.bottomMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    implicitHeight: grid.height
                    implicitWidth: grid.width
                    radius: 5

                    color: RosePine.overlay
                    MonthGrid {
                        anchors {
                            centerIn: parent
                            fill: parent
                        }
                        id: grid
                        month: Time.month_0_base
                        year: Time.year_int
                        locale: Qt.locale("C")
                        font: "JetBrainsMonoNL Nerd Font Propo"

                        implicitWidth: 180

                        delegate: Text {
                            required property var model

                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: grid.locale.toString(model.date, "d")
                            font {
                                family: grid.font
                                bold: grid.month === model.month ? parseInt(text) === Time.day_int : false
                            }

                            color: grid.month === model.month ? (parseInt(text) === Time.day_int ? RosePine.gold : RosePine.text) : RosePine.muted
                        }
                    }
                }
            }
        }

    }
}
