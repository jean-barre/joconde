import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: target
        x: parent.width / 2
        y: parent.height / 2
        width: 10
        height: 10
        radius: 5
        color: "black"
    }

    function setTargetPosition(x, y) {
        console.log("move: "+x+";"+y)
        target.x = x
        target.y = y
    }
}
