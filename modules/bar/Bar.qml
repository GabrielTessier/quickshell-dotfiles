import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root

            property int barHeight: 35
            property int marginTop: 5
            property int marginBottom: 5

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: "transparent"

            // Hauteur fixée par le contenu
            implicitHeight: barHeight + marginTop + marginBottom

            Item {
                id: barContent
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    topMargin: marginTop
                }

                height: parent.height - marginTop - marginBottom

                // Rectangle gauche
                /*Rectangle {
                    id: leftBox
                    color: "#240046"
                    radius: 8

                    width: 50
                    height: parent.height

                    anchors {
                        left: parent.left
                        leftMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                }*/

                // Rectangle central
                Rectangle {
                    id: centerBox
                    color: "#3C096C"
                    radius: 8

                    ClockWidget {
                        id: clock
                        anchors.centerIn: parent
                        color: "white"
                    }

                    width: clock.implicitWidth + 20
                    height: parent.height

                    anchors.centerIn: parent
                }

                // Rectangle droite
                /*Rectangle {
                    id: rightBox
                    color: "#5A189A"
                    radius: 8

                    width: 50
                    height: parent.height

                    anchors {
                        right: parent.right
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                }*/
            }
        }
    }
}
