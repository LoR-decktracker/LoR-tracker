import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
	property bool isEnemy: false
	id: sidebar
	visible: true
	flags: Qt.FramelessWindowHint
	width: 200 + squareRect.radius
	height: 400
	color: "transparent"
	LayoutMirroring.enabled: isEnemy
	LayoutMirroring.childrenInherit: true

	Rectangle {
		id: squareRect
		color: "#333333"
		opacity: 0.80
		height: parent.height

		radius: 20
		anchors.right: parent.right
		anchors.rightMargin: -radius
		anchors.left: parent.left
	}

	property var barModel

	Row {
		id: optionBar
		anchors.top: parent.top
		height: 30

	}

	ListView {
		id: listview
		height: childrenRect.height
		anchors.top: optionBar.bottom
		anchors.topMargin: 0

		anchors.right: parent.right
		anchors.left: parent.left
		anchors.leftMargin: squareRect.radius

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
