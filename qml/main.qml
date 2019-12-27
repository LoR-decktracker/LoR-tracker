import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import Coordinates 1.0 as Coordinates

ApplicationWindow {
    id: mainWindow
    flags: Qt.Widget | Qt.FramelessWindowHint | Qt.WindowTransparentForInput | Qt.WindowStaysOnTopHint
    visible: true
    title: qsTr("LoR-DeckTracker")
    color: "transparent"
    x: Coordinates.Cord.x_l
    y: Coordinates.Cord.y_t


    Window {
        id: windowOne
        color: "green"
        visible: true
        flags: Qt.FramelessWindowHint
        width: 200
        height: 200
        x: Coordinates.Cord.x_l
        y: (Coordinates.Cord.y_b - Coordinates.Cord.y_t) / 2
           + Coordinates.Cord.y_t - windowTwo.height / 2
        CheckBox {}
    }

    Window {
        id: windowTwo
        visible: true
        flags: Qt.FramelessWindowHint
        color: "red"
        width: 200
        height: 200
        x: Coordinates.Cord.x_r - windowTwo.width
        y: (Coordinates.Cord.y_b - Coordinates.Cord.y_t) / 2
           + Coordinates.Cord.y_t - windowTwo.height / 2
        CheckBox {}
    }

    // hooking timer
    Timer {
        interval: 10
        running: true
        repeat: true
        onTriggered: Coordinates.Cord.hooking()
    }
}
