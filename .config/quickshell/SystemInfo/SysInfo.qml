pragma Singleton

import QtQuick

import Quickshell
import Quickshell.Io

Singleton {
    property int cpuUsagePercentage: 0
    property int lastCPUIdle: 0
    property int lastCPUTotal: 0
    property string usedMem: ""
    property string totalMem: ""
    property int usedMemPercentage: 0
    property int tempCPU: 0

    Timer {
        running: true
        repeat: true
        interval: 2000
        onTriggered: {
            cpuProc.running = true
            // memPercentageProc.running = true
            memProc.running = true
            tempProc.running = true
        }
    }

    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCPUTotal > 0)
                    cpuUsagePercentage = Math.round(100 * (1 - (idle - lastCPUIdle) / (total - lastCPUTotal)))
                lastCPUTotal = total
                lastCPUIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Process {
        id: memPercentageProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                var m = data.trim().split(/\s+/)
                var total = parseInt(m[1])
                var used  = parseInt(m[2])
                usedMemPercentage = Math.floor(used / total * 100)
            }
        }
        // Component.onCompleted: running = true
    }

    Process {
        id: memProc
        command: ["sh", "-c", "free -h --si | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                var m = data.trim().split(/\s+/)
                totalMem = m[1]
                usedMem  = m[2]
            }
        }
        Component.onCompleted: running = true
    }

    Process {
        id: tempProc
        command: ["sh", "-c", "/home/alex/.config/quickshell/SystemInfo/scripts/cpu_temp.sh"]
        stdout: SplitParser {
            onRead: data => {
                tempCPU = Math.floor(parseInt(data) / 1000)
            }
        }
        Component.onCompleted: running = true
    }
}
