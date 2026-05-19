import QtQuick

Rectangle {
    id: root

    required property color bgNormal
    required property color bgHovered

    color: bgNormal
    state: "NORMAL"

    states: [
        State {
            name: "NORMAL"
            PropertyChanges { target: root; color: bgNormal }
        },
        State {
            name: "HOVERED"
            PropertyChanges { target: root; color: bgHovered }
        },
    ]

    transitions: [
        Transition {
            from: "NORMAL"
            to: "HOVERED"
            ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
        },
        Transition {
            from: "HOVERED"
            to: "NORMAL"
            ColorAnimation { easing.type: Easing.InOutQuad; duration: 100 }
        },
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        onEntered: {
            parent.state = "HOVERED"
        }
        onExited: {
            parent.state = "NORMAL"
        }
    }
}

