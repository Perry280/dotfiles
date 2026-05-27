import QtQuick

import ".."

Item {
    required property color fg

    Text {
        anchors.centerIn: parent

        color: fg
        font {
            family: "JetBrainsMonoNL Nerd Font Propo"
            pixelSize: 15
            // bold: true
            // hintingPreference: Font.PreferVerticalHinting
        }

        renderType: Text.QtRendering

        text: Volume.volume // + "%"
    }   
}

