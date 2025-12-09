import Quickshell
import Quickshell.Hyprland
import QtQuick

import qs.config

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root

            required property var modelData
            screen: modelData

            anchors {
              top: true
              left: true
              bottom: true
            }

            color: "transparent"

            implicitWidth: Config.leftBar.size

            Rectangle {
                anchors.fill: parent

                color: "khaki"

                //implicitWidth: Config.leftBar.size

                //topRightRadius: 12
                //bottomRightRadius: 12

                // Top
                Column {
                    anchors {
                        top: parent.top
                        topMargin: 10
                        left: parent.left
                    }

                    spacing: 2

                    Rectangle { color: "red"; width: 50; height: 50 }
                    Rectangle { color: "green"; width: 20; height: 50 }
                    Rectangle { color: "blue"; width: 50; height: 20 }
                }

                // Center
                Column {
                    anchors.centerIn: parent

                    spacing: 2

                    ActiveWindow {}
                }

                // Bottom
                Column {
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 10
                    }

                    spacing: 2

                    //Rectangle { color: "red"; width: 50; height: 50 }
                    Wifi {
                        rootWindow: this
                    }
                    Bluetooth {
                        rootWindow: this
                    }
                    Rectangle { color: "green"; width: 20; height: 50 }
                    Rectangle { color: "blue"; width: 50; height: 20 }
                }
            }
        }
    }
}
