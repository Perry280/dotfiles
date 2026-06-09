import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris

import ".."

Rectangle {
    id: mp
    visible: MediaPlayer.anyPlayers
    implicitHeight: Style.widgetHeight
    implicitWidth: items.spacing * 5 + iconItem.width + artistItem.width + separator.width + trackItem.width
    radius: 5

    color: RosePine.leaf

    function truncate_string(str) {
        var max_len = 25
        if (str.length <= max_len)
            return str

        return str.substring(0, max_len-3).trim() + "..."
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 150
            easing.type: Easing.OutQuad
        }
    }

    RowLayout {
        id: items
        Item {
            id: iconItem
            Layout.preferredHeight: Style.widgetHeight
            Layout.preferredWidth: Style.widgetHeight
            Layout.alignment: Qt.AlignVCenter

            IconImage {
                anchors.centerIn: parent
                source: Quickshell.iconPath("media-playback-playing-symbolic")
                implicitSize: 16
                opacity: MediaPlayer.isPlaying ? 1 : 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCirc
                    }
                }

                layer.enabled: true
                layer.effect: MultiEffect {
                    colorization: 1.0
                    colorizationColor: Style.colors.fgAlt
                }
            }

            IconImage {
                anchors.centerIn: parent
                source: Quickshell.iconPath("media-playback-paused-symbolic")
                implicitSize: 16
                opacity: MediaPlayer.isPlaying ? 0 : 1

                Behavior on opacity {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCirc
                    }
                }

                layer.enabled: true
                layer.effect: MultiEffect {
                    colorization: 1.0
                    colorizationColor: Style.colors.fgAlt
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var player = MediaPlayer.get_first_player()
                    if (player.canTogglePlaying)
                        player.togglePlaying()
                }
            }
        }

        Item {
            id: artistItem
            Layout.preferredHeight: Style.widgetHeight
            Layout.preferredWidth: artist.width
            Layout.alignment: Qt.AlignVCenter

            Text {
                id: artist
                anchors.centerIn: parent

                color: Style.colors.fgAlt
                font {
                    family: Style.fontfamily
                    pixelSize: 12
                }

                renderType: Text.QtRendering

                text: truncate_string(MediaPlayer.artist)
            }   
        }

        Separator {
            id: separator
            Layout.alignment: Qt.AlignCenter
        }

        Item {
            id: trackItem
            Layout.preferredHeight: Style.widgetHeight
            Layout.preferredWidth: track.width
            Layout.alignment: Qt.AlignVCenter

            Text {
                id: track
                anchors.centerIn: parent

                color: Style.colors.fgAlt
                font {
                    family: Style.fontfamily
                    pixelSize: 12
                }

                renderType: Text.QtRendering

                text: truncate_string(MediaPlayer.track)
            }   
        }
    }
}
