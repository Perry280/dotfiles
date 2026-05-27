import QtQuick
import QtQuick.Layouts

import ".."

ColumnLayout {
    // spacing: 10

    BlankEntry {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20

        textEntry: "Shutdown"
        iconEntry: "system-shutdown-panel"
        iconColor: RosePine.love
        command: ["sh", "-c", "/home/alex/.config/quickshell/SessionWidget/scripts/poweroff.sh"]

        Layout.topMargin: 5
        // Layout.fillWidth: true
        // Layout.leftMargin: 10
        // Layout.rightMargin: 10
        // Layout.preferredWidth: 300
    }

    Separator {
        Layout.alignment: Qt.AlignCenter
    }

    BlankEntry {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20

        textEntry: "Reboot"
        iconEntry: "system-reboot-symbolic"
        iconColor: RosePine.rose
        command: ["sh", "-c", "/home/alex/.config/quickshell/SessionWidget/scripts/reboot.sh"]
    }

    Separator {
        Layout.alignment: Qt.AlignCenter
    }

    BlankEntry {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20


        textEntry: "Suspend"
        iconEntry: "system-suspend-symbolic"
        iconColor: RosePine.foam
        command: ["sh", "-c", "/home/alex/.config/quickshell/SessionWidget/scripts/suspend.sh"]
    }

    Separator {
        Layout.alignment: Qt.AlignCenter
    }

    BlankEntry {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20

        textEntry: "Logout"
        iconEntry: "system-log-out-symbolic"
        iconColor: RosePine.leaf
        command: ["sh", "-c", "/home/alex/.config/quickshell/SessionWidget/scripts/logout.sh"]
    }

    Separator {
        Layout.alignment: Qt.AlignCenter
    }

    BlankEntry {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20

        textEntry: "Lock"
        iconEntry: "system-lock-screen-symbolic"
        iconColor: RosePine.iris
        command: ["sh", "-c", "/home/alex/.config/quickshell/SessionWidget/scripts/lock.sh"]

        Layout.bottomMargin: 5
    }
}
