import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Rectangle {
	property int cost: 5
	property string name: "Card Name"
	property int count: 2
	property int region
	property bool isEnemy: false

	color: "white"

	width: 200
	height: 40
	radius: barRadius
	opacity: 1
	antialiasing: false


	// style
	property int borderWidth: 4
	property int barRadius: 10
	property string fontName: "Open Sans"

	gradient: Gradient {
		orientation: Gradient.Horizontal
		GradientStop { position: isEnemy ? 0.0 : 1.0
			color: "#00fbc02d" }
		GradientStop { position: isEnemy ? 1.0 : 0.0
			color: "#fbc02d" }
	}

	Rectangle{
		id: bar
		anchors.topMargin: borderWidth
		anchors.bottomMargin: borderWidth
		anchors.leftMargin: borderWidth
		anchors.fill: parent
		radius: barRadius
	}

	Item {
		id: element
		anchors.right: coutBox.left
		anchors.left: bar.left
		anchors.bottom: bar.bottom
		anchors.top: bar.top

		Rectangle {
			id: manaCostBox
			height: parent.height - 4
			width: height
			color: "#0091ea"
			radius: width*0.5
			anchors.leftMargin: 4
			anchors.topMargin: 4
			anchors.bottomMargin: 4
			anchors.bottom: parent.bottom
			anchors.top: parent.top
			anchors.left: parent.left

			Text {
				id: manaCostText
				color: "white"
				text: cost
				
				// fontSizeMode: Text.Fit
				renderType: Text.QtRendering
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				anchors.fill: parent
				font.pixelSize: 24
				font.family: fontName
				font.bold: true
			}
		}

		Text {
			id: cardNameText
			anchors.leftMargin: 0
			anchors.bottom: parent.bottom
			anchors.top: parent.top
			anchors.left: manaCostBox.right
			color: "black"
			text: name
			font.pointSize: 18
			font.family: fontName
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
		}

	}


	Rectangle {
		id: coutBox
		width: parent.height
		color: "#212121"
		anchors.bottom: parent.bottom
		anchors.top: parent.top
		anchors.right: parent.right


		Text {
			id: countText
			text: count
			color: "white"
			font.pointSize: 18
			font.family: fontName
			font.bold: true
			anchors.fill: parent
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
		}
	}

}
