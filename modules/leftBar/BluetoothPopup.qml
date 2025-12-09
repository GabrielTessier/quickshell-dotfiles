import QtQuick
import Quickshell

import qs
import qs.config
import qs.components

PopupWindow {
    id: menuWindow

    menuPosition: "bottom-left"

    color: "transparent"
    //color: "red"

    implicitWidth: 300
    implicitHeight: 300

    // Main container
    Rectangle {
        id: menuContainer

        width: 300
        height: 300

        topRightRadius: 40
        //bottomRightRadius: 12
        //radius: 12

        border.width: 1

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                GlobalStates.bluetoothMenuMouseOn = true;
            }
            onExited: {
                GlobalStates.bluetoothMenuMouseOn = false;
                GlobalStates.bluetoothMenuOpen = false;
            }

            Text {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                text: "BLUETOOTH"
                font.pixelSize: 40
            }
        }
    }
}
