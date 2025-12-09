import QtQuick

Text {
    FontLoader {
        id: iconFont
        source: "root:/assets/fonts/MaterialIcons-Regular.ttf"
    }

    font.family: iconFont.name
    font.pixelSize: 30
    anchors.centerIn: parent
}
