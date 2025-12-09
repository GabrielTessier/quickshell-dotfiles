import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Quickshell
import Quickshell.Io

import qs
import qs.services
import qs.components

PopupWindow {
    id: menuWindow

    menuPosition: "bottom-left"

    color: "transparent"
    //color: "red"

    implicitWidth: menuContainer.width
    implicitHeight: menuContainer.height

    // Main container
    Rectangle {
        id: menuContainer

        width: 300
        height: 300

        topRightRadius: 40
        //bottomRightRadius: 12
        //radius: 12

        border.width: 1

        // Auto-scan timer based on config
        Timer {
            interval: 1000
            running: true //Network.wifiEnabled
            repeat: true
            onTriggered: {
                if (Network.wifiEnabled) {
                    Network.scanNetworks();
                }
            }
        }

        // Initial scan
        Component.onCompleted: {
            if (Network.wifiEnabled) {
                Network.scanNetworks();
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                GlobalStates.wifiMenuMouseOn = true;
            }
            onExited: {
                GlobalStates.wifiMenuMouseOn = false;
                GlobalStates.wifiMenuOpen = false;
            }

            Text {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                text: "WIFI"
                font.pixelSize: 40
            }

            ColumnLayout {
                anchors.centerIn: parent
                Switch {
                    text: qsTr("Wi-Fi")
                    checked: Network.wifiEnabled
                    onClicked: Network.toggleWifi()
                }
                Text {
                    text: Network.ethernet ?
                        qsTr("Connected via Ethernet") :
                        (Network.wifiEnabled ?
                         (Network.connected ? qsTr("Connected to %1").arg(Network.ssid) : qsTr("WiFi enabled")) :
                         qsTr("WiFi disabled"))
                }

                Flickable {
                    width: column.width
                    height: 100
                    // indispensable pour cacher ce qui dépasse
                    clip: true

                    contentHeight: column.implicitHeight

                    ScrollBar.vertical: ScrollBar {
                        policy: ScrollBar.AlwaysOn
                    }

                    Column {
                        id: column
                        spacing: 4
                        Repeater {
                            model: Network.networks
                            Button {
                                text: modelData.ssid
                                onClicked: {
                                    notify.msg = modelData.ssid;
                                    notify.running = true;
                                }
                            }
                        }
                    }
                    Process {
                        id: notify
                        property string msg
                        command: ["./notify-send", msg]
                        running: false
                    }
                }
            }
        }
    }
}
