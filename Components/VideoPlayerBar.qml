import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

Rectangle {
    color: Colors.bgColor

    property alias volumeSliderValue: volumeSlider.value
    property alias videoPosition: positionSlider.value

    signal playClicked()
    signal pauseClicked()
    signal muteClicked()
    signal unmuteClicked()
    signal screenShotMade()
    signal videoRecorded()
    signal rewindSlider(var sliderPosition)

    Slider {
        id: positionSlider
        anchors.verticalCenter: parent.top
        anchors.right: parent.right
        width: parent.width + 10
        handle.width: 20
        handle.height: 20
        onPressedChanged: {
            if(!pressed)
                rewindSlider(position)
        }

    }

    RowLayout {
        anchors {
            fill: parent
            leftMargin: 5
            rightMargin: 5
        }

        ColoredButton {
            id: volumeButton
            Layout.preferredHeight: 25
            Layout.preferredWidth: 25
            color: Colors.transparentColor
            checkable: true
            checked: true
            Image {
                anchors.centerIn: parent
                sourceSize: Qt.size(25, 25)
                source: parent.checked ? "qrc:/images/assets/icons/volume_icon.png" : "qrc:/images/assets/icons/mute_white.png"
            }

            onClicked: {
                if(checked)
                    unmuteClicked()
                else
                    muteClicked()
            }
        }

        Slider {
            id: volumeSlider
            Layout.preferredWidth: 80
            Layout.preferredHeight: 30
            value: 1.0

            handle.height: 20
            handle.width: 20
        }



        ColoredButton {
            id: playpauseButton
            Layout.preferredHeight: 25
            Layout.preferredWidth: 25
            color: Colors.transparentColor
            checkable: true
            checked: true
            Image {
                anchors.centerIn: parent
                sourceSize: Qt.size(25, 25)
                source: parent.checked ? "qrc:/images/assets/icons/pause-icon.png" : "qrc:/images/assets/icons/play_icon.png"
            }
            onClicked: {
                if(checked)
                    playClicked()
                else
                    pauseClicked()
            }
        }

        Item {
            Layout.fillWidth: true
        }

        ColoredButton {
            id: makeScreenShotButton
            Layout.preferredHeight: 35
            Layout.preferredWidth: 35

            Image {
                anchors.centerIn: parent
                sourceSize: Qt.size(27, 27)
                source: "qrc:/images/assets/icons/screenShoot.png"
            }

           background: Rectangle {
               color: Colors.secondaryColor
               opacity: 0.54
               radius: 25
           }

           onClicked: screenShotMade()
        }

        ColoredButton {
            id: recordVideoButton
            Layout.preferredHeight: 35
            Layout.preferredWidth: 35
            checkable: true
            checked: false

            Rectangle {
                anchors.centerIn: parent
                color: Colors.warningTextColor
                height: parent.checked ? 17 : 25
                width: parent.checked ? 17 : 25
                radius: parent.checked ? 4 : 15
            }

           background: Rectangle {
               color: Colors.secondaryColor
               opacity: 0.54
               radius: 25
           }
           onCheckedChanged: {
               if(!checked)
                   videoRecorded()
           }
        }

        Item {
            Layout.fillWidth: true
        }

        ColoredButton {
            id: fullScreenModeButton
            Layout.preferredHeight: 25
            Layout.preferredWidth: 25
            color: Colors.transparentColor
            checkable: true
            Image {
                anchors.centerIn: parent
                sourceSize: Qt.size(25, 25)
                source: "qrc:/images/assets/icons/fullscreen_white.png"
            }
        }
    }
}
