import Quickshell
import QtQuick

import qs.modules.bar
import qs.modules.leftBar

ShellRoot {
    id: root

    property bool enableTopBar: true
    property bool enableLeftBar: true

    // Modules
    Loader { active: enableTopBar; sourceComponent: Bar {} }
    Loader { active: enableLeftBar; sourceComponent: LeftBar {} }
}
