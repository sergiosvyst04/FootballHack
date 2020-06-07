import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.13
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/CoachRoomBG.jpg"
    nextButtonVisible: false


    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 16
            rightMargin: 16
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Requests")
            font: Fonts.nunitoSans(30)
        }

        DescriptionText {
            Layout.preferredWidth: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: qsTr("Watch match. Detect Errors. And send them to your players.")
            font: Fonts.nunitoSans(14)
        }

        Video {
            id: video
            Layout.topMargin: 40
            Layout.fillWidth: true
            Layout.preferredHeight: 300

            fillMode: VideoOutput.Stretch
            source: "qrc:/images/assets/icons/videoplayback.mp4"
            volume: videoplayerBar.volumeSliderValue

            MouseArea {
                id: rewindBack
                anchors.left: parent.left
                height: parent.height
                width: parent.width / 2

                onDoubleClicked: video.seek(video.position - 10000)
            }

            MouseArea {
                id: rewindForward
                anchors.right: parent.right
                height: parent.height
                width: parent.width / 2

                onDoubleClicked: video.seek(video.position + 10000)
            }

            VideoPlayerBar {
                id: videoplayerBar
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50

                videoPosition: video.position / video.duration

                onRewindSlider: video.seek(video.duration * sliderPosition)
                onPauseClicked: video.pause()
                onPlayClicked: video.play()
                onMuteClicked: volumeSliderValue = 0.0
                onUnmuteClicked: volumeSliderValue = 1.0
                onVideoRecorded: sendErrorPopup.active = true
                onScreenShotMade: sendErrorPopup.active = true

                DescriptionText {
                    anchors {
                        left: videoplayerBar.left
                        leftMargin: 10
                        bottom: videoplayerBar.top
                        bottomMargin: 20
                    }
                    font: Fonts.nunitoSans(9)
                    text: "%1/<b>%2</b>".arg(Math.round(video.position / 1000)).arg(Math.round(video.duration / 1000))
                }
            }

            Component.onCompleted: {
                play()
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    Loader {
        id: sendErrorPopup
        active: false

        sourceComponent: Popup {
            anchors.centerIn: parent
            width: 250
            height: 480
            modal: true
            parent: Overlay.overlay
            visible: true

            onAboutToHide: addTeamPopup.active = false

            background: Rectangle {
                color: Colors.secondaryColor
            }

            contentItem: ColumnLayout {
                anchors {
                    fill: parent
                    topMargin: 25
                    leftMargin: 15
                    rightMargin: 15
                    bottomMargin: 35
                }
                spacing: 25

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Detected Error")
                    font: Fonts.nunitoSansBold(14)
                }

               Rectangle {
                   Layout.fillWidth: true
                   Layout.preferredHeight: 100
                   color: "red"
               }

               ColumnLayout {
                   DescriptionText {
                       Layout.alignment: Qt.AlignLeft
                       text: qsTr("Send to")
                       font: Fonts.nunitoSans(11)
                   }

                   LocationCombobox {
                       id: playersCombobox
                       Layout.fillWidth: true
                       Layout.preferredHeight: 50
                       currentIndex: -1
                       onActivated: {
                           currentIndex = index
                           displayText = playersModel.get(currentIndex).name
                       }

                       background: Rectangle {
                           anchors.fill: parent
                           color: Colors.bgColor
                           opacity:  0.5
                       }

                       displayText: textAt(currentIndex)

                       model: playersModel

                       delegate:  InviteListViewDelegate {
                           color: Colors.bgColor
                           forInvite: false
                           width: parent.width
                           height: 50

                           name: model.name
                           playerPhoto: model.photo
                       }
                   }
               }

               ScrollingTextArea {
                Layout.fillWidth: true
                textAreaHeight: 80
                label: qsTr("Comment")
                bgColor: Colors.bgColor
               }




                ColoredButton {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 80
                    color: Colors.transparentColor
                    text: qsTr("Send")

                    font: Fonts.nunitoSansBold(20)
                    fontColor: Colors.white

                    onClicked: {
                          sendErrorPopup.active = false
                    }
                }
            }

        }

    }

}
