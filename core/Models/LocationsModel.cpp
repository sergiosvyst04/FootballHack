#include "LocationsModel.hpp"
#include "QFile"
#include "QTextStream"

LocationsModel::LocationsModel(QObject *parent)
    : QAbstractListModel(parent)
{
    _dataMap = getData();
}

int LocationsModel::rowCount(const QModelIndex &parent) const
{
    return _locations.size();
}

QVariant LocationsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

   const QString& location = _locations.at(index.row());
   return location;
}

QHash<int, QByteArray> LocationsModel::roleNames() const
{
    static QHash<int, QByteArray> roleNames {
        {LocationRole, "location"}
    };

    return roleNames;
}

QMap<QString, QVector<QString>> LocationsModel::getData()
{
    QMap<QString, QVector<QString>> citiesMap;
    QFile file("/home/sergio/Desktop/TripFiles/Countries_Cities");

    QTextStream txtstream(&file);
    if(file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        while(!txtstream.atEnd())
        {
            QString line = txtstream.readLine();
            QStringList stringlist = line.split("\t\t\t\t");
            QString country = stringlist.at(1);
            QString city = stringlist.at(0);
            if(citiesMap.contains(country))
            {
                if(citiesMap[country].contains(city)) {

                }
                else {
                    citiesMap[country].push_back(city);
                }

            } else {
                citiesMap.insert(country, {city});
            }
        }
    }

    return citiesMap;
}


void LocationsModel::getCountries()
{
    QVector<QString> countries;
    for(auto p = _dataMap.begin(); p != _dataMap.end(); ++p)
    {
        countries.push_back(p.key());
    }

    beginResetModel();
    _locations = countries;
    endResetModel();
}

void LocationsModel::getCities(QString country)
{
    beginResetModel();
    _locations = _dataMap[country];
    std::sort(_locations.begin(), _locations.end());
    endResetModel();
}

void LocationsModel::getVisitedLocations(QVector<QString> visitedLocations)
{
    beginResetModel();
    _locations = visitedLocations;
    endResetModel();
}

void LocationsModel::setCitiesWithTravelAgents(QVector<QString> citiesWithAgents)
{
    beginResetModel();
    _locations = citiesWithAgents;
    endResetModel();
}
