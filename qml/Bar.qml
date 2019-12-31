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

    Rectangle {
        id: manaCostBox
         width: parent.width<parent.height?parent.width:parent.height
         height: width
         color: "blue"
         radius: width*0.5

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
