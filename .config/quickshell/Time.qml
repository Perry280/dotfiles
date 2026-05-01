pragma Singleton

import Quickshell // Scope

Singleton {
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm ddd d/M/yyyy")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
