import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"


BasePage {
    bgImage: "qrc:/images/assets/icons/bright1.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Next")

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 18
            rightMargin: 18
            topMargin: 30
        }
        spacing: 35

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Create Account")
            font: Fonts.nunitoSans(30)
        }

        ColumnLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Country residence")
                font: Fonts.nunitoSans(11)
            }

            LocationCombobox {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                currentIndex: -1
                model: ["a", "b", "c", "d", "e"]

                onActivated: {
                    currentIndex = index
                    popup.close()
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
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                currentIndex: -1
                model: ["A", "B", "C", "D", "E"]
            }
        }

        PopupActivationButton {
            id: birthButton
            Layout.fillWidth: true
            labelText: qsTr("Date of birth")
            fieldText: birthTumbler.date

            popupContentItem: BirthTumbler {
                id: birthTumbler
                onClose: {
                 birthButton.popupItem.close()
                }
            }

        }

        Item {
            Layout.fillHeight: true
        }



    }

}
