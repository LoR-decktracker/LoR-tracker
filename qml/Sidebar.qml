import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
    id: sidebar
    visible: true
    flags: Qt.FramelessWindowHint
    width: 200
    height: 400

    ListView {
        width: 200
        height: 400
        model: lst
        delegate: Text{
            text: name
        }
    }
}
