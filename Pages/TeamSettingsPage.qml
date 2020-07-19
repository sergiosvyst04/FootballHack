import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"
import LocationsModel 1.0
import Qt.labs.platform 1.1

BasePage {
    bgImage: "qrc:/images/assets/icons/PerfectialCup.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Save")


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

    Flickable {
        id: scrollView
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 15
        }
        boundsBehavior: Flickable.StopAtBounds
        contentHeight: column.height
        contentWidth: column.width
        clip: true
        ColumnLayout {
            id:column
            width: scrollView.width
            spacing: 20

            DescriptionText {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Settings")
                font: Fonts.nunitoSans(30)
            }

            LabeledTextEdit {
                id: teamName
                Layout.fillWidth: true
                label: qsTr("Name")
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
                        source: "qrc:/images/assets/icons/PerfectialSuqad.jpg"
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
                        source: "qrc:/images/assets/icons/PerfectialLogo.png"
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
                    text: qsTr("Coach")
                    font: Fonts.nunitoSans(11)
                }

                LocationCombobox {
                    id: coachComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    currentIndex: -1
                    onActivated: {
                        currentIndex = index
                        displayText = playersModel.get(currentIndex).name
                    }

                    background: Rectangle {
                        anchors.fill: parent
                        color: Colors.secondaryColorWithOpacity
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

            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Captain")
                    font: Fonts.nunitoSans(11)
                }

                LocationCombobox {
                    id: captainComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    currentIndex: -1
                    onActivated: {
                        currentIndex = index
                        displayText = playersModel.get(currentIndex).name
                    }

                    background: Rectangle {
                        anchors.fill: parent
                        color: Colors.secondaryColorWithOpacity
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

            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Admin")
                    font: Fonts.nunitoSans(11)
                }

                LocationCombobox {
                    id: adminComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    currentIndex: -1
                    onActivated: {
                        currentIndex = index
                        displayText = playersModel.get(currentIndex).name
                    }

                    background: Rectangle {
                        anchors.fill: parent
                        color: Colors.secondaryColorWithOpacity
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

            Item {
                Layout.preferredHeight: 60
            }

        }
    }

}
