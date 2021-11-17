import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    color: "#00000000"
    title: "Countdown timer"

    property int remaining: 600
    property int minutes: Math.floor(root.remaining / 60)
    property int seconds: root.remaining - root.minutes * 60

    Text {
        id: minutesText
        text: Math.floor(root.remaining / 60) + " :"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 155
        font.bold: true
        font.pixelSize: 70
    }

    Text {
        id: secondsText
        text: root.seconds > 9 ? "" + root.seconds: "0" + root.seconds
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 50
        font.bold: true
        font.pixelSize: 70
    }

    Button {
        id: btnPlus
        text: "+"
        anchors.left: parent.left
        anchors.leftMargin: 0
        onClicked: root.remaining++
    }

    Button {
        id: btnMinus
        x: 150
        text: "-"
        onClicked: root.remaining--
    }

    Button {
        id: btnStart
        x: 300
        text: "Start"
        onClicked: {
            btnPlus.visible = false
            btnMinus.visible = false
            btnStart.visible = false
            root.flags = Qt.Window | Qt.FramelessWindowHint
            countdownTimer.start()
        }
    }

    Timer {
        id: countdownTimer
        repeat: true
        interval: 1000

        onTriggered: {
            root.remaining--
            if (root.remaining === 0) {
                countdownTimer.stop()
            }
        }
    }
}
