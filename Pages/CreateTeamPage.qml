import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"
import LocationsModel 1.0
import Qt.labs.platform 1.1

BasePage {
    bgImage: "qrc:/images/assets/icons/CreateTeamBG.jpg"
    nextButtonVisible: true
    nextButtonEnabled: teamNameField.validated /*&& cityComboBox.currentIndex != -1*/
    nextButtonText: qsTr("Next")
    onNextButtonClicked: navigateToItem("qrc:/Pages/CreateTeamNextPage.qml", {teamName : teamNameField.text})

    LocationsModel {
        id: citiesModel
        Component.onCompleted: getCities("Ukraine")
    }

    FileDialog {
        id: dialog
        property bool isForEmblem
        onAccepted: {
            if(isForEmblem)
                emblemImage.source = currentFile
            else
                teamImage.source = currentFile
        }
    }


    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 30
            rightMargin: 20
            leftMargin: 20
        }
        spacing: 13


        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            font: Fonts.nunitoSans(30)
            text: qsTr("Create Team")
        }


        LabeledTextEdit {
            id: teamNameField
            Layout.fillWidth: true
            label: qsTr("Name")
            validated: text.length > 2
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 30
            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Emblem")
                    font: Fonts.nunitoSans(11)
                }

                Image {
                    id: emblemImage
                    Layout.preferredHeight: 80
                    Layout.preferredWidth: 80
                }
            }

            ColoredButton {
                id: removeEmblemImageBtn
                Layout.preferredHeight: 25
                Layout.preferredWidth: 25

                back.radius: 13
                visible: emblemImage.status !== Image.Null

                font: Fonts.nunitoSansBold(10)
                fontColor: Colors.bgColor
                text: qsTr("X")
                onClicked: emblemImage.source = ""
            }

            Item {
                Layout.fillWidth: true
            }

            ColoredButton {
                id: downloadEmblemButton
                Layout.alignment: Qt.AlignRight
                Layout.preferredHeight: 40
                Layout.preferredWidth: 80

                back.color: Colors.transparentColor
                back.border.width: 1
                back.border.color: Colors.white
                enabled: emblemImage.status === Image.Null
                opacity: enabled ? 1 : 0.5



                text: qsTr("Download")
                fontColor: Colors.white
                font: Fonts.nunitoSansBold(9)

                onClicked: {
                    dialog.isForEmblem = true
                    dialog.open()
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 30
            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: teamImage.width
                    text: qsTr("Team photo")
                    font: Fonts.nunitoSans(11)
                }

                Image {
                    id: teamImage
                    Layout.preferredHeight: 80
                    Layout.preferredWidth: 80
                    source: ""
                }
            }

            ColoredButton {
                id: removeTeamImageBtn
                Layout.preferredHeight: 25
                Layout.preferredWidth: 25
                back.radius: 13
                visible: teamImage.status !== Image.Null

                font: Fonts.nunitoSansBold(10)
                fontColor: Colors.bgColor
                text: qsTr("X")
                onClicked: teamImage.source = ""
            }

            Item {
                Layout.fillWidth: true
            }

            ColoredButton {
                id: downloadTeamPhotoButton
                Layout.preferredHeight: 40
                Layout.preferredWidth: 80

                back.color: Colors.transparentColor
                back.border.width: 1
                back.border.color: Colors.white
                enabled:  teamImage.status === Image.Null
                opacity: enabled ? 1 : 0.5

                text: qsTr("Download")
                fontColor: Colors.white
                font: Fonts.nunitoSansBold(9)

                onClicked: {
                    dialog.isForEmblem = false
                    dialog.open()
                }
            }
        }


        ColumnLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("City residence")
                font: Fonts.nunitoSans(11)
            }

            LocationCombobox {
                id: cityComboBox
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                currentIndex: -1
                model: citiesModel
            }
        }

        Item {
            Layout.fillHeight: true
        }

    }


}
