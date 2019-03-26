#ifndef DETECTIONTHREAD_H
#define DETECTIONTHREAD_H

#include <QThread>

#include <opencv2/objdetect.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

class DetectionThread : public QThread
{
    Q_OBJECT
public:
    explicit DetectionThread(QObject *parent = nullptr);

private:
    VideoCapture capture;
    Mat frame, image;
    int camera;
    CascadeClassifier cascade;
    double scale;

    string cascadeName;
    string nestedCascadeName;
    void run();
    void detectAndDraw( Mat& img, CascadeClassifier& cascade, double scale);
signals:
    void faceDetected(double, double);
};

#endif // DETECTIONTHREAD_H
