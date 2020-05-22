#ifndef PLAYERSSORTFILTERMODEL_H
#define PLAYERSSORTFILTERMODEL_H

#include <QSortFilterProxyModel>

class PlayersSortFilterModel : public QSortFilterProxyModel
{
    Q_OBJECT
    Q_PROPERTY(QString searchPattern READ searchPattern WRITE setSearchPattern)
public:
    explicit PlayersSortFilterModel(QObject *parent = nullptr);


    QString searchPattern() const;
    void setSearchPattern(const QString &searchPattern);

private: 
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const override;
    QString _searchPattern;
};

#endif // PLAYERSSORTFILTERMODEL_H
