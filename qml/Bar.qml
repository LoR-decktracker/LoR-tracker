import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Rectangle {
	id: rectangle
	property int cost: 5
	property string name: "Card Name"
	property int count: 2
	property int region
	property bool isEnemy: false

	color: "white"

	width: 200
	height: 20
	radius: barRadius
	opacity: 1
//	antialiasing: false


	// style
	property int borderWidth: 4
	property int barRadius: 8
	property string fontName: "Open Sans"

	property string borderColor: "fbc02d"

	gradient: borderGradient

	Gradient {
		id: borderGradient
		orientation: Gradient.Horizontal
		GradientStop { position: isEnemy ? coutBox.width/rectangle.width : 1 - coutBox.width/rectangle.width
			color: "#00" + borderColor }
		GradientStop { position: isEnemy ? 1.0 : 0.0
			color: "#" + borderColor}
	}

	property string barColor: "ef5350"

	Gradient {
		id: barGradient
		orientation: Gradient.Horizontal
		GradientStop { position: isEnemy ? 0.0 : 1.0
			color: "#00" + barColor }
		GradientStop { position: isEnemy ? 1.0 : 0.0
			color: "#" + barColor }
	}


	Rectangle{
		id: bar
		anchors.topMargin: borderWidth
		anchors.bottomMargin: borderWidth
		anchors.leftMargin: borderWidth
		radius: barRadius - borderWidth
		anchors.rightMargin: -20

		anchors.right: coutBox.left
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.top: parent.top

		gradient: barGradient
	}

	Item {
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
				font.pixelSize: Math.min(parent.height, parent.width)
				font.family: fontName
				font.bold: true
			}
		}

		Text {
			id: cardNameText
			anchors.leftMargin: 4
			anchors.bottom: parent.bottom
			anchors.top: parent.top
			anchors.left: manaCostBox.right
			color: "white"
			text: name
			font.pixelSize: 14
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
			font.pixelSize: Math.min(parent.height, parent.width) * (3/4)
			font.family: fontName
			font.bold: true
			anchors.fill: parent
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
		}
	}

}
