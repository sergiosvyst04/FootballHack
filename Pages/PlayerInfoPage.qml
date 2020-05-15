import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/bright1.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Next")
    onNextButtonClicked: navigateToItem("qrc:/Pages/BiographyPage.qml",
                                        {payload: {fullName : payload.fullName, nic: payload.nic, email: payload.email, password : payload.password,
                                            countryResidence: payload.countryResidence, cityResidence: payload.cityResidence, dateOfBirth: payload.dateOfBirth,
                                            footballPositions: footballPositionsButton.text, futsalPositions: fusalPositionsButton.text, workingLeg: workingLegComboBox.textAt(workingLegComboBox.currentIndex)}})


    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
            topMargin: 30
        }
        spacing: 35

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            font: Fonts.nunitoSans(30)
            text: qsTr("Create Account")
        }

        DescriptionText {
            Layout.alignment: Qt.AlignLeft
            font: Fonts.nunitoSansBold(14)
            text: qsTr("What do you play?")
        }

        ColumnLayout {
            id: kindOfSportsColumn
            spacing: 20

            KindOfSportCheckBox {
                id: footballCheckBox
                Layout.fillWidth: true
                text: qsTr("Football")
                checked: false
            }

            KindOfSportCheckBox {
                id: futsalCheckBox
                Layout.fillWidth: true
                text: qsTr("Futsal")
                checked: false
            }
        }

        ColumnLayout {
            id: footballPosition
            visible: footballCheckBox.checked

            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Football position")
                font: Fonts.nunitoSans(11)
            }

            ColoredButton {
                id: footballPositionsButton
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                color: Colors.secondaryColor
                contentItem: Text {
                    leftPadding: 15
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font: Fonts.nunitoSans(12)
                    text: parent.text
                    color: Colors.white
                }

                onClicked:  {
                    positionsPopup.active = true
                    positionsPopup.isFootballPositions = true
                }


            }
        }

        ColumnLayout {
            id: futsalPosition
            visible: futsalCheckBox.checked

            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Futsal position")
                font: Fonts.nunitoSans(11)
            }

            ColoredButton {
                id: fusalPositionsButton
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                color: Colors.secondaryColor

                contentItem: Text {
                    leftPadding: 15
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    font: Fonts.nunitoSans(12)
                    text: parent.text
                    color: Colors.white
                }

                onClicked: {
                    positionsPopup.active = true
                    positionsPopup.isFootballPositions = false
                }
            }

        }

        ColumnLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Working leg")
                font: Fonts.nunitoSans(11)
            }

            LocationCombobox {
                id: workingLegComboBox
                Layout.fillWidth: true
                Layout.preferredHeight: 50

                model: ["Right", "Left"]
                currentIndex: -1
                popup.height: 120
            }
        }

        Item {
            Layout.fillHeight: true
        }


    }

    Loader {
        id: positionsPopup
        active: false
        property bool isFootballPositions
        property var checkedPositions: []

        sourceComponent: Popup {
            visible: true
            modal: true
            parent: Overlay.overlay
            anchors.centerIn: parent

            width: 250
            height: positionsPopup.isFootballPositions ? 450 : 350

            background: Rectangle {
                anchors.fill: parent
                color: Colors.secondaryColor
            }

            contentItem: ColumnLayout {
                anchors {
                    fill: parent
                    margins: 15
                }

                DescriptionText {
                    Layout.preferredWidth: parent.width
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    font: Fonts.nunitoSans(12)
                    text: qsTr("Your preferred positions")
                }

                ColumnLayout {
                    Layout.topMargin: 20

                    Repeater {
                        id: positionsRepeater
                        model: positionsPopup.isFootballPositions ? ["GK", "LD", "CD", "RD", "DMF", "AMF", "RW", "LW", "CF", "Coach"]
                                                                  : ["GK", "DEF", "WIN", "FRW", "Coach"]

                        delegate: KindOfSportCheckBox {
                            text: modelData
                            indicatorItem.color: Colors.bgColor
                            indicatorItem.opacity: 0.7
                            indicatorItem.width: 20
                            onCheckedChanged:  {
                                if(checked)
                                    positionsPopup.checkedPositions.push(text)
                                else {
                                    var indexToRemove = positionsPopup.checkedPositions.indexOf(text)
                                    positionsPopup.checkedPositions.splice(indexToRemove, 1)
                                }
                            }
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                }

                ColoredButton {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 80
                    color: Colors.transparentColor
                    font: Fonts.nunitoSansBold(20)
                    fontColor: Colors.white
                    text: qsTr("Ok")
                    onClicked: {
                        positionsPopup.active = false
                        if(positionsPopup.isFootballPositions)
                            footballPositionsButton.text = positionsPopup.checkedPositions.join(" ")
                        else
                            fusalPositionsButton.text = positionsPopup.checkedPositions.join(" ")
                        positionsPopup.checkedPositions = []
                    }
                }
            }

        }


    }
}
