import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {

    implicitWidth: text.implicitWidth
    implicitHeight: text.implicitHeight

    readonly property HyprlandToplevel activeToplevel: Hyprland.activeToplevel?.wayland?.activated ? Hyprland.activeToplevel : null

    Text {
        id: text

        text: activeToplevel?.title ?? qsTr("Desktop")
        font.pixelSize: 12
        rotation: 90
    }
}
