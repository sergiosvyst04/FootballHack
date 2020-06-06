import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/CoachRoomBG.jpg"

    nextButtonVisible: true
    nextButtonText: qsTr("Send endorsement")

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
        }
        spacing: 50

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Endorsements")
            font: Fonts.nunitoSans(30)
        }


        TabBar {
            id: tasksErrorsTabBar
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth:  parent.width - 50
            Layout.preferredHeight: 50
            spacing: 0

            currentIndex: tabBarIndex

            background: Rectangle {
                color: Colors.transparentColor
            }

            ReviewTabButton {
                text: "Tasks"
                height: 50
            }

            ReviewTabButton {
                text: "Errors"
                height: 50
            }
        }

        ColumnLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Player")
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

        ColumnLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: tasksErrorsTabBar.currentIndex === 0 ? qsTr("Tasks") : qsTr("Errors")
                font: Fonts.nunitoSans(11)
            }

            LocationCombobox {
                id: tasksErrorsCombobox
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
