pragma Singleton

import QtQuick

QtObject {
    readonly property string fontfamily: "JetBrainsMonoNL Nerd Font Propo"
    readonly property int fontsize: 15
    readonly property int barHeight: 34
    readonly property int gaps: 5
    readonly property int widgetHeight: 24

    readonly property QtObject colors: QtObject {
        readonly property color bgMain: RosePine.base
        readonly property color bgWidget: RosePine.overlay
        readonly property color bgAlt: RosePine._nc
        readonly property color bgHL1: RosePine.highlight_med
        readonly property color bgHL2: RosePine.highlight_high
        readonly property color fg: RosePine.text
        readonly property color fgAlt: RosePine.overlay
    }
}
