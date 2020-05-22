#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <core/Models/LocationsModel.hpp>
#include <core/Models/playerssortfiltermodel.h>
#include <QtQml>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<LocationsModel>("LocationsModel", 1, 0, "LocationsModel");
    qmlRegisterType<PlayersSortFilterModel>("PlayerSortFilterModel", 1, 0, "PlayerSortFilterModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
