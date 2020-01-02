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
    width: Coordinates.Cord.x_r - Coordinates.Cord.x_l
    height: Coordinates.Cord.y_b - Coordinates.Cord.y_t


    Sidebar {
        id: leftWindow
//        color: "green"
        x: Coordinates.Cord.x_l
        y: (Coordinates.Cord.y_b - Coordinates.Cord.y_t) / 2
           + Coordinates.Cord.y_t - height / 2
        barModel: lst
        LayoutMirroring.enabled: true
    }

    Sidebar {
        id: rightWindow
//        color: "red"
        x: Coordinates.Cord.x_r - width
        y: (Coordinates.Cord.y_b - Coordinates.Cord.y_t) / 2
           + Coordinates.Cord.y_t - height / 2
        barModel: lst
    }
}
