import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
    property var barModel
    id: sidebar
    visible: true
    flags: Qt.FramelessWindowHint
    width: 200
    height: 400

    ListView {
        width: parent.height
        height: parent.height
        model: barModel
        delegate: Bar {
            width: 200
            height: 40
            cost: bar.cost
            name: bar.name
            count: bar.count
        }

    }
}
