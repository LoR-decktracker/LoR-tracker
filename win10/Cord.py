from PySide2.QtCore import QTimer, QObject, Property, Signal
from win32gui import FindWindow, GetWindowRect


class Cord(QObject):
    posChange = Signal()
    global timer

    # TODO: find the right window
    def __init__(self, parent=None, window=FindWindow(None, "cmd")):
        super().__init__(parent)
        self.window = window

        self._x_l = self._y_t = self._x_r = self._y_b = 0

        self.setup_timer()

    @Property(int, notify=posChange)
    def x_l(self):
        return self._x_l

    @Property(int, notify=posChange)
    def y_t(self):
        return self._y_t

    @Property(int, notify=posChange)
    def x_r(self):
        return self._x_r

    @Property(int, notify=posChange)
    def y_b(self):
        return self._y_b

    def equals(self, x_l, y_t, x_r, y_b):
        return x_l == self._x_l \
               and y_t == self._y_t \
               and x_r == self._x_r \
               and y_b == self._y_b

    def setup_timer(self):
        global timer
        timer = QTimer(interval=5000)
        timer.timeout.connect(lambda: self.hooking())
        timer.start()

    def hooking(self):
        x_l, y_t, x_r, y_b = GetWindowRect(self.window)

        if not self.equals(x_l, y_t, x_r, y_b):
            print(x_l, y_t, x_r, y_b)
            self._x_l, self._y_t, self._x_r, self._y_b = x_l, y_t, x_r, y_b

            self.posChange.emit()

# def makeHook(engine):
#     global timer
#     timer = QTimer(interval=33)
#
#
#     window = FindWindow(None, "cmd")
#     root = engine.rootObjects()[0]
#
#     timer.timeout.connect(lambda: hooking(root, window))
#
#     timer.start()
#
#
#
# def hooking(r, window):
#     x, y, x_r, y_b = GetWindowRect(window)
#
#     # print(x, y, x_r, y_b)
#     # r.setScreen(screen)
#
#     r.setGeometry(x_r - r.width() - 8
#                   , (y_b - y) / 2 + y - r.height()/2
#                   , r.width()
#                   , r.height())
