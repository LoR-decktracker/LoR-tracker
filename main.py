import sys

from qtpy.QtCore import QUrl
from qtpy.QtGui import QGuiApplication
from qtpy.QtQml import QQmlApplicationEngine

from utility.Setup import Setup


def main():
	app = QGuiApplication([])
	engine = QQmlApplicationEngine()

	setup = Setup(app, engine)

	setup.setup_hooking()
	setup.setup_bars()

	# Load QML
	url = QUrl("qml/main.qml")
	engine.load(url)

	sys.exit(app.exec_())


if __name__ == '__main__':
	main()
