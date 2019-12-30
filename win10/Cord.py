from PySide2.QtCore import QObject, Property, QMetaMethod, Signal, Slot
from win32gui import FindWindow, GetWindowRect


class Cord(QObject):
    _main_instance = None
    changed = Signal()

    #
    @staticmethod
    def get_instance(*args):
        if Cord._main_instance is None:
            Cord._main_instance = Cord()
            print("new")

        return Cord._main_instance

    # TODO: find the right window
    def __init__(self, parent=None, window=FindWindow(None, "File Explorer")):
        super().__init__()
        self._window = window
        self._x_l = self._y_t = self._x_r = self._y_b = 0

    @Property(int, notify=changed)
    def x_l(self):
        return self._x_l + 8

    @Property(int, notify=changed)
    def y_t(self):
        return self._y_t

    @Property(int, notify=changed)
    def x_r(self):
        return self._x_r - 8

    @Property(int, notify=changed)
    def y_b(self):
        return self._y_b

    def equals(self, x_l, y_t, x_r, y_b):
        return x_l == self._x_l \
               and y_t == self._y_t \
               and x_r == self._x_r \
               and y_b == self._y_b

    @Slot()
    def hooking(self):
        x_l, y_t, x_r, y_b = GetWindowRect(self._window)

        if not self.equals(x_l, y_t, x_r, y_b):
            # DEBUG
            print(x_l, y_t, x_r, y_b)
            self._x_l, self._y_t, self._x_r, self._y_b = x_l, y_t, x_r, y_b
            self.changed.emit()
