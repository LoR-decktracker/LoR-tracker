import sys

from PySide2.QtCore import QUrl
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

from dataObjects.Bar import Bar, Region
from dataObjects.BarList import BarList

import platform

# import system specific files
if platform.system() == "Windows":
    print("Windows Detected")
    from win10.Cord import Cord
else:
    exit()

if __name__ == '__main__':
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    # engine.setR

    # Send Singleton with coordinates of target window to QML
    # qmlRegisterSingletonType(Cord, "Coordinates", 1, 0, "Cord", Cord.get_instance)
    engine.rootContext().setContextProperty("Cord", Cord.get_instance())

    lst = [Bar("user1", 1, 1, Region.DEMACIA), Bar("User2", 1, 1, Region.DEMACIA)]
    barList = BarList(lst)

    engine.rootContext().setContextProperty("lst", barList)

    # Load QML
    url = QUrl("qml/main.qml")
    engine.load(url)

    sys.exit(app.exec_())
