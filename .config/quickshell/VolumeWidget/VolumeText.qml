import QtQuick

import ".."

Item {
    required property color fg

    Text {
        anchors.centerIn: parent

        color: fg
        font {
            family: Style.fontfamily
            pixelSize: Style.fontsize
            // bold: true
            // hintingPreference: Font.PreferVerticalHinting
        }

        renderType: Text.QtRendering

        text: Volume.volume // + "%"
    }   
}

