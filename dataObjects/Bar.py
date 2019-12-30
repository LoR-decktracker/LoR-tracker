from qtpy.QtCore import QObject, Signal, Property
from enum import Enum


class Region(Enum):
    DEMACIA = 0
    IONIA = 1
    PILTOVER_ZAUN = 2
    FRELJORD = 3
    NOXUS = 4
    SHADOW_ISLES = 5


class Bar(QObject):

    def __init__(self, name: str, cost: int, count: int, region: Region):
        """
        :param name:
        :param cost:
        :param count:
        :param region: should be an enum of Region
        """
        QObject.__init__(self)

        self.__name = name
        self.__cost = cost
        self.__count = count
        self.__region = region

    # ----------------------------------------------------------------------------------------------------------------------

    nameChanged = Signal()

    @Property(str, notify=nameChanged)
    def name(self) -> str:
        return self.__name

    @name.setter
    def name(self, name: str):
        self.__name = name
        self.nameChanged.emit()

    # cost
    costChanged = Signal()

    @Property(int, notify=costChanged)
    def cost(self):
        return self.__cost

    @cost.setter
    def cost(self, cost: int):
        self.__cost = cost
        self.costChanged.emit()

    # count
    countChanged = Signal()

    @Property(int, notify=countChanged)
    def count(self):
        return self.__count

    @count.setter
    def count(self, count: int):
        self.__count = count
        self.countChanged.emit()

    # region
    regionChanged = Signal()

    @Property(int, notify=regionChanged)
    def region(self) -> Region:
        return self.__region

    @region.setter
    def region(self, region: Region):
        self.__region = region
        self.regionChanged.emit()
