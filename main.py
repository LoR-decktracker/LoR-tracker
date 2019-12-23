from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl

import platform

if platform.system() == "Windows":
    print("Windows Detected")
    from win10.Cord import Cord
else:
    exit()


def setup_hook(engine):
    # set coordinate hooking
    cord = Cord()
    engine.rootContext().setContextProperty("cord", cord)


if __name__ == '__main__':
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    # make it so that the overlay stays attached to the window
    setup_hook(engine)

    # Load QML
    url = QUrl("qml/main.qml")
    engine.load(url)

    app.exec_()
    del engine
