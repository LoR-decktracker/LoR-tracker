from PySide2.QtCore import QAbstractListModel, QModelIndex, Qt


class BarList(QAbstractListModel):
    NameRole = Qt.UserRole
    AgeRole = Qt.UserRole + 1

    def __init__(self, lst: list):
        super().__init__()
        self._lst = lst

    def rowCount(self, parent=QModelIndex()):
        return len(self._lst)

    def data(self, index, role):
        row = index.row()
        lst = [
            {'name': 'jon', 'age': 20},
            {'name': 'jane', 'age': 25}
        ]
        return lst[row]['name']

    def roleNames(self):
        return {
            BarList.NameRole: b'name',
            BarList.AgeRole: b'count'
        }
