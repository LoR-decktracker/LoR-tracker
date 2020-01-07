'''
meant to be used with BarList.py
'''

from enum import Enum

from qtpy.QtCore import QObject, Signal, Property, Qt, QTimer


class Region(Enum):
	DEMACIA = 0
	IONIA = 1
	PILTOVER_ZAUN = 2
	FRELJORD = 3
	NOXUS = 4
	SHADOW_ISLES = 5


class Bar(QObject):
	roles = {
		Qt.UserRole + 1: b'bar'
	}

	def __init__(self, name: str, cost: int, count: int, region: Region):
		"""
		:param name:
		:param cost:
		:param count:
		:param region: should be an enum of Region
		"""
		super().__init__()

		self._name = name
		self._cost = cost
		self._count = count
		self._region = region

		#FIXME romove the timer for prod
		self.timer = QTimer(interval=1000)
		self.timer.timeout.connect(self.inc)
		self.timer.start()

	def inc(self):

		self._cost = self._cost + 1 if self._cost < 9 else 0

		self.costChanged.emit()
	# ----------------------------------------------------------------------------------------------------------------------

	nameChanged = Signal()

	@Property(str, notify=nameChanged)
	def name(self) -> str:
		return self._name

	@name.setter
	def name(self, name: str):
		self._name = name
		self.nameChanged.emit()

	# cost
	costChanged = Signal()

	@Property(int, notify=costChanged)
	def cost(self):
		return self._cost

	@cost.setter
	def cost(self, cost: int):
		self._cost = cost
		self.costChanged.emit()

	# count
	countChanged = Signal()

	@Property(int, notify=countChanged)
	def count(self):
		return self._count

	@count.setter
	def count(self, count: int):
		self._count = count
		self.countChanged.emit()

	# region
	regionChanged = Signal()

	@Property(int, notify=regionChanged)
	def region(self) -> Region:
		return self._region

	@region.setter
	def region(self, region: Region):
		self._region = region
		self.regionChanged.emit()
