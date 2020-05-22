#include "playerssortfiltermodel.h"
#include <QDebug>

PlayersSortFilterModel::PlayersSortFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent)
{
}


void PlayersSortFilterModel::setSearchPattern(const QString &searchPattern)
{
    qDebug() << "set search pattern to : " << searchPattern;
    _searchPattern = searchPattern;

    invalidate();
}

QString PlayersSortFilterModel::searchPattern() const
{
    return _searchPattern;
}

bool PlayersSortFilterModel::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    auto originalModel = sourceModel();
    if (!originalModel && !source_parent.isValid())
        return false;

    auto originalModelIndex = originalModel->index(source_row, 0, source_parent);

    if(!originalModelIndex.isValid())
        return false;

    auto playerName = originalModel->data(originalModelIndex).toString();

    return _searchPattern.isEmpty() ? false : playerName.contains(_searchPattern, Qt::CaseInsensitive);
}


