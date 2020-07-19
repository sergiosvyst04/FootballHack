import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/TeamReviewBG.jpg"
    property bool isForReview: false


    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 25
            rightMargin: 25
            bottomMargin: 20
        }
        spacing: 10

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            font: isForReview ? Fonts.nunitoSansBold(20) : Fonts.nunitoSans(18)
            text: qsTr("FC Perfectial")
        }

        Image {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: isForReview ? parent.width : 95
            Layout.preferredHeight: isForReview ? 140 : 95
            source: isForReview ? "qrc:/images/assets/icons/PerfectialSuqad.jpg" : "qrc:/images/assets/icons/PerfectialLogo.png"
        }

        ColumnLayout {
            Layout.fillWidth: true
            visible: isForReview
            DescriptionText {
                text: qsTr("Statistics")
                font: Fonts.nunitoSans(10)
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 15

                ListView {
                    Layout.preferredWidth: 170
                    Layout.preferredHeight: 50

                    orientation: ListView.Horizontal
                    clip: true
                    spacing: 5
                    model: 10

                    delegate: Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        width: 30
                        height: 30
                        radius: 2
                        color: Colors.activeSwitchColor
                        DescriptionText {
                            anchors.centerIn: parent
                            font: Fonts.nunitoSansBold(8)
                            text: "W"
                        }
                    }
                }

                ColoredButton {
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredHeight: 30
                    Layout.preferredWidth: 60

                    background: Rectangle {
                        anchors.fill: parent
                        color: Colors.transparentColor
                        border.width: 1
                        border.color: Colors.white
                    }

                    fontColor: Colors.white
                    font: Fonts.nunitoSans(8)
                    text: qsTr("See all")
                }
            }
        }

        DescriptionText {
            Layout.alignment: Qt.AlignLeft
            font: Fonts.nunitoSans(15)
            text: qsTr("Coach")
        }

        TeamPlayerItem {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            errorsRespectsVisible: false
            playerName: qsTr("Yurii Tsybyk")
            age: 40
            avatar: "qrc:/images/assets/icons/Tsybyk.jpg"
        }

        DescriptionText {
            Layout.alignment: Qt.AlignLeft
            font: Fonts.nunitoSans(15)
            text: qsTr("Players")
        }

        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 15
            clip: true

            model: playersModel

           delegate: TeamPlayerItem {
                errorsRespectsVisible: !isForReview
                width: parent.width
                height: 80
                playerName: model.name
                age: model.age
                avatar: model.ava
            }

        }

    }

    ListModel {
        id: playersModel
        ListElement {name : "Serhii Svyst"; age: 23; ava: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name : "Andrii Diachuk"; age: 25; ava: "qrc:/images/assets/icons/Diachuk.png"}
        ListElement {name : "Pavlo Snylyk"; age: 26; ava: "qrc:/images/assets/icons/Snylyk.png"}
        ListElement {name : "Orest Pashkevych"; age: 27; ava: "qrc:/images/assets/icons/Pashkevych.png"}
        ListElement {name : "Serhii Svyst"; age: 23; ava: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name : "Serhii Svyst"; age: 23; ava: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name : "Serhii Svyst"; age: 23; ava: "qrc:/images/assets/icons/Avatar.png"}
    }
}
