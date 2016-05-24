#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine/qtwebengineglobal.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QtWebEngine::initialize();

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  engine.rootContext()->setContextProperty("browserUrl", "https://videochat.rentouch.ch/device/index.html?session=ABCDF&");

  return app.exec();
}
