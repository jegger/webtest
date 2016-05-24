import QtQuick 2.0
import QtWebEngine 1.0
import QtWebEngine.experimental 1.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.5

Window {
    id: window
    visible: true
    width: 500
    height: 500
    flags: Qt.FramelessWindowHint

    WebEngineView {
        anchors.fill: parent
        url: browserUrl
        onFeaturePermissionRequested: {
            grantFeaturePermission(securityOrigin, feature, true);
        }
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        property real lastMouseX: 0
        property real lastMouseY: 0
        onPressed: {
            lastMouseX = mouseX
            lastMouseY = mouseY
        }

        onMouseXChanged: window.x += (mouseX - lastMouseX)
        onMouseYChanged: window.y += (mouseY - lastMouseY)
    }

    Button {
        y: 455
        text: "Scale up"
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        onClicked: {
            window.setHeight(800)
            window.setWidth(1900)
            window.setX(0)
            window.setY(0)
        }
    }

    Button {
        x: 361
        y: 455
        text: "Scale down"
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        onClicked: {
            window.setHeight(500)
            window.setWidth(500)
        }
    }

    Button {
        x: 200
        y: 450
        width: 124
        text: "Quit"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        onClicked: Qt.quit()
    }
}
