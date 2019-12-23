import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

ApplicationWindow {
    id: mainWindow
    objectName: mainWindow
    flags: Qt.WindowStaysOnTopHint | Qt.FramelessWindowHint
    visible: true
    title: qsTr("mainWindow")
    screen: Qt.application.screens[0]
    width: 200
    height: 200
    x: cord.x_r - width - 8
    y: (cord.y_b - cord.y_t)/2 + cord.y_t - height/2
    color: "green"


    ListView {
        id: layout;
        implicitHeight: 400
        model: 100
        delegate: Bar {}
    }
}
