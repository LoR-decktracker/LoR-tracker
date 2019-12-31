import sys
from functools import partial

import pywintypes
from qtpy.QtCore import QUrl, QTimer
from qtpy.QtGui import QGuiApplication
from qtpy.QtQml import QQmlApplicationEngine, qmlRegisterType

from dataObjects.Bar import Bar, Region
from dataObjects.BarList import BarList

import platform

# import system specific files
if platform.system() == "Windows":
    print("Windows Detected")
    from win10.Cord import Cord
else:
    exit()


def hooking_fun(cord: Cord):
    try:
        cord.hooking()
    except pywintypes.error:
        # Handel exit
        app.exit()


if __name__ == '__main__':
    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    # Send Singleton with coordinates of target window to QML
    # qmlRegisterSingletonType(Cord, "Coordinates", 1, 0, "Cord", Cord.get_instance)
    c = Cord()
    engine.rootContext().setContextProperty("Cord", c)

    timer = QTimer()
    timer.timeout.connect(partial(hooking_fun, c))
    timer.start()

    # FIXME attach to real views
    lst = [Bar("user1", 1, 3, Region.DEMACIA), Bar("User2", 2, 4, Region.DEMACIA)]
    barList = BarList(lst)

    engine.rootContext().setContextProperty("lst", barList)

    # Load QML
    url = QUrl("qml/main.qml")
    engine.load(url)

    sys.exit(app.exec_())
