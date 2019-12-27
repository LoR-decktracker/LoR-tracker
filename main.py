import sys

from qtpy.QtCore import QUrl
from qtpy.QtGui import QGuiApplication
from qtpy.QtQml import QQmlApplicationEngine, qmlRegisterType, qmlRegisterSingletonType

import platform

if platform.system() == "Windows":
    print("Windows Detected")
    from win10.Cord import Cord
else:
    exit()

if __name__ == '__main__':
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()



    # Add coordinates for target window
    qmlRegisterSingletonType(Cord, "Coordinates", 1, 0, "Cord", Cord.getInstance)

    # Load QML
    url = QUrl("qml/main.qml")
    engine.load(url)

    sys.exit(app.exec_())
