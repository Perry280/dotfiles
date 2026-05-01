import Quickshell // for PanelWindow
import QtQuick // for Text

Scope {
    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData
                screen: modelData

                anchors {
                    top: true
                    left: true
                    right: true
                }

                // margins {
                //     top: 10
                //     left: 10
                //     right: 10
                // }

                color: Qt.alpha(Nordic.black0, 0.9)
                implicitHeight: 30

                surfaceFormat {
                    opaque: false
                }

                ClockWidget {
                    anchors.centerIn: parent
                }
            }
        }
    }
}
