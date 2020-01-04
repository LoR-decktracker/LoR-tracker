import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
	property bool isEnemy: false

	property int barMargin: sidebar.width * 0.10
	width: 220
//	title: qsTr("LoR-DeckTracker")
	id: sidebar
	visible: true
	flags: Qt.FramelessWindowHint
	color: "transparent"
	LayoutMirroring.enabled: isEnemy
	LayoutMirroring.childrenInherit: true

	Rectangle {
		id: squareRect
		color: "#333333"
		opacity: 0.80
		height: parent.height
		width: parent.width

		radius: 20
		anchors.right: parent.right
		anchors.rightMargin: -radius
		anchors.left: parent.left
	}

	property var barModel

	Row {
		id: optionBar
		visible: !isEnemy
		anchors.top: parent.top
		anchors.left: parent.left
		anchors.leftMargin: barMargin
		height: 30
		Text{
			color: "#f2f2f2"
			text: "Etiam eget"
		}
	}

	ListView {
		id: listview
		height: childrenRect.height
		anchors.top: optionBar.bottom
		anchors.topMargin: 0

		anchors.right: parent.right
		anchors.left: parent.left
		interactive: false
		model: barModel
		delegate: Bar {
			width: sidebar.width - barMargin
			// FIXME set height scaling factor
			height: 40 *  (sidebar.width / (sidebar.width + barMargin))

			anchors.right: parent.right

			cost: bar.cost
			name: bar.name
			count: bar.count
		}
	}

//	Window {
//		x: sidebar.x - width
//		y: 0
//		visible: true
//		flags: Qt.FramelessWindowHint | Qt.WindowTransparentForInput | Qt.WindowStaysOnTopHint
//		color: "red"
//		width: 40
//		height: 40
//	}

}
