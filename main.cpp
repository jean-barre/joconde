#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "qmlcontroller.h"
#include "detectionthread.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    DetectionThread *t;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    QmlController *controller = new QmlController(engine.rootObjects().first());

    try {
        t = new DetectionThread();
    } catch (std::exception& e) {
        std::cerr << "Detection Thread construction error: " << e.what() << endl;
    }
    QObject::connect(t, SIGNAL(faceDetected(double,double)), controller, SLOT(setFacePosition(double,double)));
    t->start();

    return app.exec();
}
