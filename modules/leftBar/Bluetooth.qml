pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs
import qs.components

Item {
    id: wifi
    implicitWidth: parent.width
    implicitHeight: content.height

    property Item rootWindow

    Rectangle {
        id: content
        anchors.centerIn: parent
        implicitWidth: 40
        implicitHeight: 40
        color: "red"
        radius: 8

        TextIcon {
            text: false ? "bluetooth" : "bluetooth_disabled"
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            GlobalStates.bluetoothMenuOpen = true;
        }
        onExited: {
            outMouse.start()
        }
    }
    Timer {
        id: outMouse
        interval: 50
        onTriggered: {
            GlobalStates.bluetoothMenuOpen = GlobalStates.bluetoothMenuMouseOn;
        }
    }
    Loader {
        id: popupLoader
        active: GlobalStates.bluetoothMenuOpen
        sourceComponent: Component {
            BluetoothPopup {}
        }
    }
}
