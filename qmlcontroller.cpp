#include "qmlcontroller.h"
#include <iostream>

QmlController::QmlController(QObject *parent) : QObject(parent), qmlObject(parent)
{

}

void QmlController::setFacePosition(double x, double y)
{
    QMetaObject::invokeMethod(qmlObject, "setTargetPosition", Q_ARG(QVariant,x), Q_ARG(QVariant,y));
}
