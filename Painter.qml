import QtQuick 2.0

Item {
    id: root

    property string painterImageUrl
    property string leftEyeImageUrl
    property string rightEyeImageUrl

    property double scaling_by_width: (painter.sourceSize.width / root.width)
    property double scaling_by_height: (painter.sourceSize.height / root.height)
    property double scaling: (scaling_by_width > scaling_by_height) ? scaling_by_width : scaling_by_height

    property double horizontalOffset: (root.width - painter.sourceSize.width / scaling) / 2
    property double verticalOffset: (root.height - painter.sourceSize.height / scaling) / 2

    //left eye
    property double leftEyeXOrigin
    property double leftEyeYOrigin
    property double leftEyeXLeftLimit
    property double leftEyeXRightLimit
    property double leftEyeYTopLimit
    property double leftEyeYBottomLimit
    property double leftEyeX: leftEyeXOrigin + horizontalOffset
    property double leftEyeY: leftEyeYOrigin + verticalOffset
    //right eye
    property double rightEyeXOrigin
    property double rightEyeYOrigin
    property double rightEyeXLeftLimit
    property double rightEyeXRightLimit
    property double rightEyeYTopLimit
    property double rightEyeYBottomLimit
    property double rightEyeX: rightEyeXOrigin + horizontalOffset
    property double rightEyeY: rightEyeYOrigin + verticalOffset

    property int cameraXOring: 340
    property int cameraYOrigin: 240
    property int cameraXLeftLimit: 102
    property int cameraXRightLimit: 546
    property int cameraYTopLimit: 102
    property int cameraYBottomLimit: 546

    Image {
        id: leftEye
        source: leftEyeImageUrl
        x: leftEyeX
        y: leftEyeY
        width: sourceSize.width / scaling
        height: sourceSize.height / scaling
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: rightEye
        source: rightEyeImageUrl
        x: rightEyeX
        y: rightEyeY
        width: sourceSize.width / scaling
        height: sourceSize.height / scaling
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: painter
        source: painterImageUrl
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }


    function setTargetPosition(x, y) {

        leftEyeX = ((x < cameraXRightLimit) ?
                        ((x > cameraXLeftLimit) ?
                            ((leftEyeXRightLimit - leftEyeXLeftLimit) /
                            (cameraXRightLimit - cameraXLeftLimit)) *
                            (x - cameraXOring) + leftEyeXOrigin :
                            leftEyeXLeftLimit) :
                        leftEyeXRightLimit)
                    + horizontalOffset

        leftEyeY = ((y < cameraYBottomLimit) ?
                        ((y > cameraYTopLimit) ?
                            ((leftEyeYBottomLimit - leftEyeYTopLimit) /
                             (cameraYBottomLimit - cameraYTopLimit)) *
                             (y - cameraYOrigin) + leftEyeYOrigin :
                            leftEyeYTopLimit) :
                        leftEyeYBottomLimit)
                    + verticalOffset

        rightEyeX = ((x < cameraXRightLimit) ?
                        ((x > cameraXLeftLimit) ?
                            ((rightEyeXRightLimit - rightEyeXLeftLimit) /
                            (cameraXRightLimit - cameraXLeftLimit)) *
                            (x - cameraXOring) + rightEyeXOrigin :
                            rightEyeXLeftLimit) :
                        rightEyeXRightLimit)
                    + horizontalOffset

        rightEyeY = ((y < cameraYBottomLimit) ?
                        ((y > cameraYTopLimit) ?
                            ((rightEyeYBottomLimit - rightEyeYTopLimit) /
                             (cameraYBottomLimit - cameraYTopLimit)) *
                             (y - cameraYOrigin) + rightEyeYOrigin :
                            rightEyeYTopLimit) :
                        rightEyeYBottomLimit)
                    + verticalOffset

    }
}
