from qtpy.QtCore import QObject, Property, Signal, Slot
from win32gui import FindWindow, GetWindowRect, SetWindowLong


class Cord(QObject):
	_changed = Signal()
	_windowFocusChange = Signal()

	# FIXME: find the right window
	def __init__(self, parent=None, window=FindWindow(None, "File Explorer"), engine=None):
		super().__init__()
		self.engine = engine

		self._window = None
		self._target_window = window
		self._x_l = self._y_t = self._x_r = self._y_b = 0


	@Property(int, notify=_changed)
	def x_l(self):
		return self._x_l + 8

	@Property(int, notify=_changed)
	def y_t(self):
		return self._y_t

	@Property(int, notify=_changed)
	def x_r(self):
		return self._x_r - 8

	@Property(int, notify=_changed)
	def y_b(self):
		return self._y_b

	def equals(self, x_l, y_t, x_r, y_b):
		return x_l == self._x_l \
		       and y_t == self._y_t \
		       and x_r == self._x_r \
		       and y_b == self._y_b

	@Slot()
	def hooking(self):
		x_l, y_t, x_r, y_b = GetWindowRect(self._target_window)

		if not self.equals(x_l, y_t, x_r, y_b):
			# DEBUG
			# print(x_l, y_t, x_r, y_b)
			self._x_l, self._y_t, self._x_r, self._y_b = x_l, y_t, x_r, y_b
			self._changed.emit()

		if self._window is None:
			r = self.engine.rootObjects()[0]
			self._window = r.winId()
			# SetParent(self._window, self._target_window)
			SetWindowLong(self._window, -8, self._target_window)




		# active_window = GetForegroundWindow()
		# print(GetWindowText(active_window))
		# if self._target_window == active_window:
		# 	if not self._is_focused:
		# 		self._is_focused = True
		# 		print("change")
		# 		self._windowFocusChange.emit()
		# else:
		# 	if self._is_focused:
		# 		self._is_focused = False
		# 		print("change")
		# 		self._windowFocusChange.emit()
		# BringWindowToTop(active_window)


