pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}
    readonly property int volume: Math.round((Pipewire.defaultAudioSink?.audio.volume ?? 0) * 100)
    readonly property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? true

    readonly property var get_icon: function() {
        if(muted || volume == 0)
            return "audio-volume-muted-symbolic"
        else if(volume <= 33)
            return "audio-volume-low-symbolic"
        else if(volume <= 66)
            return "audio-volume-medium-symbolic"
        else
            return "audio-volume-high-symbolic"
    }
}
