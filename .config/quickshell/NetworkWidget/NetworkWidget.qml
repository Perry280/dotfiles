import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets
import Quickshell.Networking

import ".."

Rectangle { 
    id: net

    height: 24
    width: 24
    color: RosePine.iris

    radius: 5

    IconImage {
        anchors.centerIn: parent

        implicitSize: 24
        source: Quickshell.iconPath(get_icon())

        layer.enabled: true
        layer.effect: MultiEffect {
            colorization: 1.0
            colorizationColor: RosePine.overlay
        }

        function get_connected_network(networks) {
            var nets = networks.values
            for (const n of nets) {
                if (n.connected)
                    return n
            }
        }

        function get_icon() {
            var devs = Networking.devices.values

            for (const d of devs) {
                if (d.type == DeviceType.Wired && d.connected)
                    return "network-wired-activated-symbolic"
                else if (d.connected) {
                    Networking.checkConnectivity()
                    var net = get_connected_network(d.networks)
                    var net_sig = net.signalStrength
                    if (Networking.connectivity == NetworkConnectivity.Full) {
                        if (net_sig < 0.2)
                            return "network-wireless-connected-0-symbolic"
                        else if (net_sig < 0.25)
                            return "network-wireless-connected-20-symbolic"
                        else if (net_sig < 0.4)
                            return "network-wireless-connected-25-symbolic"
                        else if (net_sig < 0.5)
                            return "network-wireless-connected-40-symbolic"
                        else if (net_sig < 0.6)
                            return "network-wireless-connected-50-symbolic"
                        else if (net_sig < 0.75)
                            return "network-wireless-connected-60-symbolic"
                        else if (net_sig < 0.8)
                            return "network-wireless-connected-75-symbolic"
                        else if (net_sig < 1)
                            return "network-wireless-connected-80-symbolic"
                        else
                            return "network-wireless-connected-100-symbolic"
                    }
                    else {
                        if (net_sig < 0.2)
                            return "network-wireless-0-limited-symbolic"
                        else if (net_sig < 0.4)
                            return "network-wireless-20-limited-symbolic"
                        else if (net_sig < 0.6)
                            return "network-wireless-40-limited-symbolic"
                        else if (net_sig < 0.8)
                            return "network-wireless-60-limited-symbolic"
                        else if (net_sig < 1)
                            return "network-wireless-80-limited-symbolic"
                        else
                            return "network-wireless-100-limited-symbolic"
                    }

                }
            }
            return "network-disconnected-symbolic"
        }
    }

    // state: "NORMAL"

    // states: [
    //     State {
    //         name: "NORMAL"
    //         PropertyChanges { target: net; color: bg }
    //     },
    //     State {
    //         name: "HOVERED"
    //         PropertyChanges { target: net; color: Nordic.gray1 }
    //     },
    //     State {
    //         name: "CLICKED"
    //         PropertyChanges { target: net; color: Nordic.gray2 }
    //     },
    // ]

    // transitions: [
    //     Transition {
    //         from: "NORMAL"
    //         to: "HOVERED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
    //     },
    //     Transition {
    //         from: "HOVERED"
    //         to: "NORMAL"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
    //     },
    //     Transition {
    //         from: "HOVERED"
    //         to: "CLICKED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
    //     },
    //     Transition {
    //         from: "CLICKED"
    //         to: "HOVERED"
    //         ColorAnimation { easing.type: Easing.InOutQuad; duration: 50 }
    //     }
    // ]

    MouseArea {
        anchors.fill: parent
        // hoverEnabled: true
        // onEntered: {
        //     parent.state = "HOVERED"
        // }
        // onExited: {
        //     parent.state = "NORMAL"
        // }
        // onPressed: {
        //     parent.state = "CLICKED"
        // }
        onReleased: {
            // parent.state = containsMouse ? "HOVERED" : "NORMAL"
            Quickshell.execDetached(["nm-connection-editor"])
        }
    }
}

