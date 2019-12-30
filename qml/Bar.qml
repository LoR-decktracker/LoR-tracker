import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: bar
    width: 200
    height: 40
    color: "#ffffff"

    Rectangle {
        id: manaCostBox
         width: parent.width<parent.height?parent.width:parent.height
         height: width
         color: "blue"
         radius: width*0.5



         Text {
              id: manaCost
              color: "white"
              text: "3"
              font.pointSize: 25
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignHCenter
              anchors.fill: parent
         }
    }

    Text {
        id:cardName
        text: "Name"
        anchors.left: manaCostBox.right
        color: "black"
        font.pointSize: 25
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id: coutBox
        width: parent.width<parent.height?parent.width:parent.height
        height: width
        color: "black"
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: countBox
            text: "2"
            color: "white"
            font.pointSize: 25
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    CheckBox {
        id: checkBox
        text: qsTr("Check Box")
    }
}
