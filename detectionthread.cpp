#include "detectionthread.h"

DetectionThread::DetectionThread(QObject *parent) : QThread (parent)
{
    cascadeName = "/usr/local/share/opencv4/haarcascades/haarcascade_frontalface_alt.xml";
    scale = 1;
    camera = 0;

    if (!cascade.load(samples::findFile(cascadeName)))
    {
        throw "ERROR: Could not load classifier cascade";
    }

    if(!capture.open(camera))
    {
        throw "ERROR: Could not open camera #" + to_string(camera);
    }
}

void DetectionThread::run()
{
    if( capture.isOpened() )
    {
        cout << "Video capturing has been started ..." << endl;
        while(true)
        {
            capture >> frame;
            if( frame.empty() ) {
                break;
            }
            Mat frame1 = frame.clone();
            detectAndDraw( frame1, cascade, scale);
        }
    }
}

void DetectionThread::detectAndDraw( Mat& img, CascadeClassifier& cascade, double scale)
{
    double t = 0;
    vector<Rect> faces;
    Mat gray, smallImg;

    cvtColor( img, gray, COLOR_BGR2GRAY );
    double fx = 1 / scale;
    resize( gray, smallImg, Size(), fx, fx, INTER_LINEAR_EXACT );
    equalizeHist( smallImg, smallImg );

    t = static_cast<double>(getTickCount());
    cascade.detectMultiScale( smallImg, faces,
        1.1, 2, 0
        |CASCADE_SCALE_IMAGE,
        Size(30, 30) );

    t = static_cast<double>(getTickCount()) - t;
    for ( const auto& r: faces )
    {
        Mat smallImgROI;
        vector<Rect> nestedObjects;
        Point center;

        double centerX = (r.x + r.width / static_cast<double>(2)) * scale;
        double centerY = (r.y + r.height / static_cast<double>(2)) * scale;
        double reversedCenterX = img.size().width - centerX;
        emit faceDetected(reversedCenterX, centerY);
    }
}
