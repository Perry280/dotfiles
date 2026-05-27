pragma Singleton

import QtQuick

import Quickshell
import Quickshell.Services.Mpris

Singleton {

    readonly property var players: Mpris.players.values
    readonly property int numPlayers: players.length
    readonly property bool anyPlayers: numPlayers > 0

    readonly property var get_first_player: function() {
        for (const p of players) 
            return p

        return null
    }

    readonly property bool isPlaying: anyPlayers && get_first_player().isPlaying

    readonly property var get_icon: function() {
        if (isPlaying)
            return "media-playback-playing-symbolic"
        else
            return "media-playback-paused-symbolic"
    }

    readonly property string artist: get_first_player()?.trackArtist || "Unknown"
    readonly property string track: get_first_player()?.trackTitle || "Unknown"
}
