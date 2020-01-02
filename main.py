import sys
from functools import partial

from pywintypes import error
from qtpy.QtCore import QUrl, QTimer
from qtpy.QtGui import QGuiApplication
from qtpy.QtQml import QQmlApplicationEngine, qmlRegisterType, qmlRegisterSingletonType

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
    except error:
        # Handel exit
        app.exit()

# def tr():
#     return Cord.get_instance

if __name__ == '__main__':

    app = QGuiApplication([])
    engine = QQmlApplicationEngine()

    # Send Singleton with coordinates of target window to QML
    c = Cord()
    qmlRegisterSingletonType(Cord, "Coordinates", 1, 0, "Cord", lambda *e: c)

    # engine.rootContext().setContextProperty("Cord", c)
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
