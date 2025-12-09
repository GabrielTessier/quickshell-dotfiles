import QtQuick
import Quickshell

pragma Singleton
pragma ComponentBehavior: Bound

Singleton {
    id: root

    property bool wifiMenuMouseOn: false
    property bool wifiMenuOpen: false

    property bool bluetoothMenuMouseOn: false
    property bool bluetoothMenuOpen: false
}
