
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string time: {
        Qt.locale("fr_FR").toString(new Date(), "dddd d MMMM yyyy - HH:mm")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
