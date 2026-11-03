#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("APEX Monitor");
    QGuiApplication::setOrganizationName("APEX Robotics");
    QQuickStyle::setStyle("Basic");

    QQmlApplicationEngine engine;
    engine.loadFromModule("ApexMonitor", "Main");

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
