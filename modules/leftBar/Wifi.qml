pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs
import qs.services
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
            text: Network.wifiEnabled ? "signal_wifi_4_bar" : "signal_wifi_off"
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        /*onClicked: {
            GlobalStates.wifiMenuOpen = !GlobalStates.wifiMenuOpen;
        }*/
        onEntered: {
            GlobalStates.wifiMenuOpen = true;
        }
        onExited: {
            outMouse.start()
        }
    }
    Timer {
        id: outMouse
        interval: 50
        onTriggered: {
            GlobalStates.wifiMenuOpen = GlobalStates.wifiMenuMouseOn;
        }
    }
    Loader {
        id: popupLoader
        active: GlobalStates.wifiMenuOpen
        sourceComponent: Component {
            WifiPopup {}
        }
    }
}
