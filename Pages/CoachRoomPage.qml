import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/CoachRoomBG.jpg"
    nextButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 50
            rightMargin: 50
            bottomMargin: 80
        }

        spacing: 110


        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Coach Room")
            font: Fonts.nunitoSans(30)
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 20

            model: ListModel {
                ListElement {text: qsTr("Make game review"); destination: ""}
                ListElement {text: qsTr("Tasks"); destination: ""}
                ListElement {text: qsTr("Endorsements"); destination: ""}
                ListElement {text: qsTr("Add combination"); destination: ""}
                ListElement {text: qsTr("Go on transfermarket"); destination: "qrc:/Pages/TransferMarketPage.qml"}
            }

            delegate: ColoredButton {
                width: parent.width
                height: 75

                color: Colors.secondaryColor
                text: model.text
                font: Fonts.nunitoSans(16)
                fontColor: Colors.white

                onClicked: navigateToItem(model.destination)
            }
        }
    }
}
