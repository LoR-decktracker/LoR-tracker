from qtpy.QtCore import QThread


class Thread(QThread):

	def __init__(self, parent, func, on_result, *args, **kwargs):
		super(Thread, self).__init__(parent)
		self.on_result = on_result
		self.func = func
		self.args = args
		self.kwargs = kwargs
		self.start()

	def run(self):
		result = self.func(*self.args, **self.kwargs)
		self.on_result(result)
