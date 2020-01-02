import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Rectangle {
    property int cost
    property string name
    property int count
    property int region

    id: bar
    color: "#ffffff"
    width: 200
    height: 40

    Rectangle {
        id: manaCostBox
         width: parent.height
         height: width
         color: "blue"
         radius: width*0.5
         anchors.left: parent.left
         anchors.leftMargin: 0

         Text {
              id: manaCostText
              color: "white"
              text: cost
              font.pointSize: 25
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignHCenter
              anchors.fill: parent
         }
    }

    Text {
        id: cardNameText
        text: name
        anchors.right: coutBox.left
        anchors.rightMargin: 0
        anchors.left: manaCostBox.right
        anchors.leftMargin: 0
        color: "black"
        font.pointSize: 25
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id: coutBox
        width: parent.height
        height: width
        color: "black"
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: countText
            text: count
            color: "white"
            font.pointSize: 25
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
