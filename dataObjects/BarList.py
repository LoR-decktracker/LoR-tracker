'''
for qml usage reference look at Sidebar.qml
'''

from qtpy.QtCore import QAbstractListModel, QModelIndex, Qt

from dataObjects.Bar import Bar


class BarList(QAbstractListModel):

	def __init__(self, lst: list):
		super().__init__()
		self._lst = lst

	def rowCount(self, parent=QModelIndex()):
		return len(self._lst)

	def data(self, index, role):
		row = index.row()
		return self._lst[row]

	def roleNames(self):
		return Bar.roles
