import platform
from functools import partial

from qtpy.QtCore import QTimer
from qtpy.QtGui import QGuiApplication
from qtpy.QtQml import qmlRegisterSingletonType, QQmlApplicationEngine

from pywintypes import error

# import system specific files
from dataObjects.Bar import Bar, Region
from dataObjects.BarList import BarList

if platform.system() == "Windows":
	print("Windows Detected")
	from win10.Cord import Cord
else:
	exit()


class Setup:

	def __init__(self, app: QGuiApplication, engine: QQmlApplicationEngine):
		self.app = app
		self.engine = engine

		self.timer = QTimer()
		self.c = Cord()

	def setup_hooking(self):
		# Send Singleton with coordinates of target window to QML
		qmlRegisterSingletonType(Cord, "Coordinates", 1, 0, "Cord", lambda *args: self.c)
		# engine.rootContext().setContextProperty("Cord", c)

		self.timer.timeout.connect(self._hooking_fun)
		self.timer.start()

	def _hooking_fun(self):
		try:
			self.c.hooking()
		except error:
			# Handel exit
			self.app.exit()

	def setup_bars(self):
		lst = [Bar("user1", 1, 3, Region.DEMACIA), Bar("User2", 2, 4, Region.DEMACIA)]
		self.barList = BarList(lst)
		self.engine.rootContext().setContextProperty("lst", self.barList)
