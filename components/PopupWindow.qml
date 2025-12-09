import QtQuick
import Quickshell

import qs
import qs.config

PanelWindow {
    id: menuWindow

    required property string menuPosition

    // Make it float without affecting window layout
    exclusiveZone: 0

    // Position as floating popup
    anchors.top: menuPosition.includes("top")
    anchors.left: menuPosition.includes("left")
    anchors.right: menuPosition.includes("right")
    anchors.bottom: menuPosition.includes("bottom")
}
