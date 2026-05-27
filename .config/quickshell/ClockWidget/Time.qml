pragma Singleton

import Quickshell

Singleton {
    readonly property string time:       Qt.formatDateTime(clock.date, "hh:mm")
    readonly property string date:       Qt.formatDateTime(clock.date, "ddd dd/MM/yyyy")
    readonly property int day_int:       parseInt(Qt.formatDateTime(clock.date, "d"))
    readonly property string day_string:   Qt.formatDateTime(clock.date, "ddd")
    readonly property int month_0_base:  parseInt(Qt.formatDateTime(clock.date, "M")) - 1
    readonly property string month_year_string: Qt.formatDateTime(clock.date, "MMM yyyy")
    property var get_month_with_offset: function(offset) {
        let d = new Date()
        d.setMonth(d.getMonth() + offset)
        return Qt.formatDateTime(d, "MMM yyyy")
    }
    readonly property int year_int:      parseInt(Qt.formatDateTime(clock.date, "yyyy"))

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
