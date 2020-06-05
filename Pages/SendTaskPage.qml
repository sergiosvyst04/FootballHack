import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"


BasePage {
    bgImage: "qrc:/images/assets/icons/CoachRoomBG.jpg"

    nextButtonVisible: true
    nextButtonText: qsTr("Send task")
    onNextButtonClicked: console.log("send task to ", playersCombobox.displayText)

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 30
            leftMargin: 20
            rightMargin: 20
        }
        spacing: 40

        DescriptionText {
            Layout.preferredWidth: parent.width

            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

            text: qsTr("Send tasks to your players and give them endorsements.")
            font: Fonts.nunitoSans(16)
        }

        ScrollingTextArea {
            id: task
            Layout.fillWidth: true
            textAreaHeight: 90

            label: qsTr("Task")
        }

        ColumnLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Adressee")
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

                displayText: textAt(currentIndex)

                model: playersModel

                delegate:  InviteListViewDelegate {
                    color: Colors.transparentColor
                    forInvite: false
                    width: parent.width
                    height: 50

                    name: model.name
                    playerPhoto: model.photo
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
