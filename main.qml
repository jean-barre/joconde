import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    visibility: Window.FullScreen
    title: qsTr("Hello World")
    color: "black"

    GridLayout {
        id: grid
        columns: 2
        rows: 2
        columnSpacing: 10
        rowSpacing: 10
        anchors.fill: parent

        Painter {
            id: picasso
            painterImageUrl: "img/picasso_empty.png"
            leftEyeImageUrl: "img/picasso_left_eye.png"
            rightEyeImageUrl: "img/picasso_right_eye.png"
            Layout.fillHeight: true
            Layout.fillWidth: true

            leftEyeXOrigin: 510 / scaling
            leftEyeYOrigin: 500 / scaling
            leftEyeXLeftLimit: 480 / scaling
            leftEyeXRightLimit: 550 / scaling
            leftEyeYTopLimit: 480 / scaling
            leftEyeYBottomLimit: 520 / scaling

            rightEyeXOrigin: 830 / scaling
            rightEyeYOrigin: 480 / scaling
            rightEyeXLeftLimit: 800 / scaling
            rightEyeXRightLimit: 860 / scaling
            rightEyeYTopLimit: 470 / scaling
            rightEyeYBottomLimit: 490 / scaling
        }

        Painter {
            id: dali
            painterImageUrl: "img/dali_empty.png"
            leftEyeImageUrl: "img/dali_left_eye.png"
            rightEyeImageUrl: "img/dali_right_eye.png"
            Layout.fillHeight: true
            Layout.fillWidth: true
            leftEyeXOrigin: 270 / scaling
            leftEyeYOrigin: 265 / scaling
            leftEyeXLeftLimit: 260 / scaling
            leftEyeXRightLimit: 290 / scaling
            leftEyeYTopLimit: 255 / scaling
            leftEyeYBottomLimit: 275 / scaling

            rightEyeXOrigin: 395 / scaling
            rightEyeYOrigin: 310 / scaling
            rightEyeXLeftLimit: 385 / scaling
            rightEyeXRightLimit: 410 / scaling
            rightEyeYTopLimit: 300 / scaling
            rightEyeYBottomLimit: 320 / scaling
        }

        Painter {
            id: hockney
            painterImageUrl: "img/hockney_empty.png"
            leftEyeImageUrl: "img/hockney_left_eye.png"
            rightEyeImageUrl: "img/hockney_right_eye.png"
            Layout.fillHeight: true
            Layout.fillWidth: true
            leftEyeXOrigin: 160 / scaling
            leftEyeYOrigin: 270 / scaling
            leftEyeXLeftLimit: 140 / scaling
            leftEyeXRightLimit: 180 / scaling
            leftEyeYTopLimit: 260 / scaling
            leftEyeYBottomLimit: 280 / scaling

            rightEyeXOrigin: 340 / scaling
            rightEyeYOrigin: 260 / scaling
            rightEyeXLeftLimit: 320 / scaling
            rightEyeXRightLimit: 360 / scaling
            rightEyeYTopLimit: 250 / scaling
            rightEyeYBottomLimit: 270 / scaling
        }
    }

    function setTargetPosition(x, y) {
        picasso.setTargetPosition(x, y)
        dali.setTargetPosition(x, y)
        hockney.setTargetPosition(x, y)
    }
}
