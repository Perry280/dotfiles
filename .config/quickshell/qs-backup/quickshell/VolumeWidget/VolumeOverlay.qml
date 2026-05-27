import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

import ".."

Scope {
	id: root

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	Connections {
		target: Pipewire.defaultAudioSink?.audio

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}

	property bool shouldShowOsd: false

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			anchors.bottom: true
			margins.bottom: screen.height / 10
			exclusiveZone: 0

			implicitWidth: 200
			implicitHeight: 30
			color: "transparent"

            focusable: true

			Rectangle {
				anchors.fill: parent
				radius: 5
				color: RosePine.base

                border {
                    color: RosePine._nc
                    width: 2
                }

				RowLayout {
					anchors {
						fill: parent
						leftMargin: 10
						rightMargin: 15
					}

					IconImage {
						implicitSize: 25
						source: Quickshell.iconPath(Volume.get_icon())

                        layer.enabled: true
                        layer.effect: MultiEffect {
                            colorization: 1.0
                            colorizationColor: RosePine.foam
                        }
					}

					Rectangle {
						Layout.fillWidth: true

						implicitHeight: 10
						radius: 20
						color: RosePine.overlay

						Rectangle {
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}

                            color: RosePine.foam

							implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
							radius: parent.radius
						}
					}
				}
			}
		}
	}
}
