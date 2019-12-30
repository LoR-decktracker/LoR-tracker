import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    id: mainWindow
    flags: Qt.Widget | Qt.FramelessWindowHint | Qt.WindowTransparentForInput | Qt.WindowStaysOnTopHint
    visible: true
    title: qsTr("LoR-DeckTracker")
    color: "transparent"
    x: Cord.x_l
    y: Cord.y_t
    width: Cord.x_r - Cord.x_l
    height: Cord.y_b - Cord.y_t


    Sidebar {
        id: leftWindow
        color: "green"
        x: Cord.x_l
        y: (Cord.y_b - Cord.y_t) / 2
           + Cord.y_t - height / 2
    }

    Sidebar {
        id: rightWindow
        color: "red"
        x: Cord.x_r - width
        y: (Cord.y_b - Cord.y_t) / 2
           + Cord.y_t - height / 2
    }


    // hooking timer
    // Updates the coordinates for
    Timer {
        interval: 10
        running: true
        repeat: true
        onTriggered: Cord.hooking()
    }
}
