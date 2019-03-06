#ifndef QMLCONTROLLER_H
#define QMLCONTROLLER_H

#include <QObject>
#include <QDebug>

class QmlController : public QObject
{
    Q_OBJECT
private:
    QObject *qmlObject;
public:
    explicit QmlController(QObject *parent = nullptr);

public slots:
    void setFacePosition(double,double);
};

#endif // QMLCONTROLLER_H
