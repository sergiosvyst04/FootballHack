import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"
import LocationsModel 1.0

BasePage {
    bgImage: "qrc:/images/assets/icons/TransferMarketPage.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Apply")

    LocationsModel {
        id: citiesModel
    }

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
        }
        spacing: 35


        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Filters")
            font: Fonts.nunitoSans(30)
        }

        DescriptionText {
            Layout.alignment: Qt.AlignLeft
            font: Fonts.nunitoSansBold(14)
            text: qsTr("Kind of sport")
        }

        ButtonGroup {
            id: btnGroup
            buttons: kindOfSportsRow.children
            exclusive: true
        }

        RowLayout {
            id: kindOfSportsRow
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
                enabled: true
                Component.onCompleted: citiesModel.getCities("Ukraine")
            }
        }

        ColumnLayout {
            id: position
            visible: footballCheckBox.checked || futsalCheckBox.checked

            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: footballCheckBox.checked ? qsTr("Football positions") : qsTr("Futsal positions")
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
                    positionsPopup.isFootballPositions = footballCheckBox.checked
                }


            }
        }

        ColumnLayout {
            spacing: 20
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Age")
                font: Fonts.nunitoSans(11)
            }

            DatesSlider {
                Layout.fillWidth: true
                from: 7
                to: 70
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

        sourceComponent: PositionsPopup {
            title: qsTr("Position")
            onOkClicked: {
                positionsPopup.active = false
                if(positionsPopup.isFootballPositions)
                    footballPositionsButton.text = positionsPopup.checkedPositions.join(" ")
                else
                    footballPositionsButton.text = positionsPopup.checkedPositions.join(" ")
                positionsPopup.checkedPositions = []
            }
        }
    }
}
