import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.3
import "../Components"
import "../Singletons"
import PlayerSortFilterModel 1.0

BasePage {
    bgImage: "qrc:/images/assets/icons/CreateTeamBG.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Create Team")

    property var teamName

    PlayerSortFilterModel {
        id: playerSortFilterModel

        sourceModel: playersModel
    }


    ListModel {
        id: playersModel

        ListElement {photo: "qrc:/images/assets/icons/Avatar.png"; name: qsTr("Serhii Svyst") }
        ListElement {name: qsTr("Andrii Diachuk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Pavlo Snylyk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Orest Pashkevych"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Pavlo Kozlaniuk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sergio Ramos"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sergio Aguero"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sergi Roberto"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Pavlo Maldini"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Grytchuk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Shevchenko"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Andrii Shevchenko"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sedio Mane"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Mohamad"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Jurii Tsybyk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Jurii Klop"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Andriano"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Andrii macsca"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Stepanenko"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Taras"); photo: "qrc:/images/assets/icons/Avatar.png"}
    }


    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 30
            leftMargin: 20
            rightMargin: 20
        }
        spacing: 35

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            font: Fonts.nunitoSans(30)
            text: qsTr("Create Team")
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width - 40

            font: Fonts.nunitoSans(14)
            text: qsTr("You have already created <b>%1</b> team. Lets invite some players!").arg(teamName)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        LabeledTextEdit {
            Layout.fillWidth: true
            label: qsTr("Player name")
            onTextChanged: {
                playerSortFilterModel.searchPattern = text
            }



        }

        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: -50
            clip: true

            spacing: 2
            model: playerSortFilterModel

            delegate:  InviteListViewDelegate {
                width: parent.width
                height: 50

                name: model.name
                playerPhoto: model.photo
            }
        }



    }


}
