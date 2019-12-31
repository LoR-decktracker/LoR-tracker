'''
meant to be used with BarList.py
'''

from qtpy.QtCore import QObject, Signal, Property, Qt
from enum import Enum


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
