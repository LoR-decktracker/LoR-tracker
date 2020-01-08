import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.14

Window {
	property bool isEnemy: false
	property int spacing: 4
	property int cornerRadius: 20

	id: sidebar
	visible: true
	flags: Qt.FramelessWindowHint
	color: "transparent"
	LayoutMirroring.enabled: isEnemy
	LayoutMirroring.childrenInherit: true


	height: items.height + 2* barMargin
	width: 220


	property int barMargin: sidebar.width * 0.10

	Rectangle {
		id: squareRect
		color: "#333333"
		opacity: 0.80
		height: parent.height
		width: parent.width

		radius: sidebar.cornerRadius
		anchors.right: parent.right
		anchors.rightMargin: -sidebar.cornerRadius
		anchors.left: parent.left
	}

	property var barModel

	Item {
		id:items

		height: childrenRect.height
		anchors.right: parent.right
		anchors.left: parent.left
		anchors.leftMargin: barMargin

		Row {
			id: optionBar
			visible: !isEnemy
			height: isEnemy ? 0 : childrenRect.height
			anchors.top: parent.top
			anchors.topMargin: barMargin
			Text{
				color: "#f2f2f2"
				text: "Etiam eget"
			}
		}

		ListView {
			id: listview
			height: childrenRect.height
			anchors.top: optionBar.bottom
			width: parent.width

			interactive: false
			spacing: sidebar.spacing

			model: barModel
			delegate: Bar {
				isEnemy: sidebar.isEnemy

				// FIXME set height scaling factor
				height: 40 /**  (sidebar.width / (sidebar.width + barMargin))*/
				anchors.right: parent.right
				anchors.left: parent.left

				cost: bar.cost
				name: bar.name
				count: bar.count

				MouseArea {
					anchors.fill: parent
					hoverEnabled: true
					onEntered: {
						preview.visible = true
						preview.y = parent.y + sidebar.y + optionBar.height + barMargin;
					}
					onExited: {
						preview.visible = false
					}

				}
			}
		}
	}

	    Window {
			id: preview
			x: isEnemy ? sidebar.x + sidebar.width : sidebar.x - width
			y: listview.y
			visible: false
			flags: Qt.FramelessWindowHint | Qt.WindowTransparentForInput | Qt.WindowStaysOnTopHint
			color: "red"
			width: 40
			height: 40
		}

}
