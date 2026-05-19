pragma Singleton

import Quickshell

Singleton {
    readonly property string time: Qt.formatDateTime(clock.date, "hh:mm")
    readonly property string date: Qt.formatDateTime(clock.date, "ddd dd/MM/yyyy")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
