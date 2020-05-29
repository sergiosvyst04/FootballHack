import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/TransferMarketPage.jpg"


    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 15
            bottomMargin: 10
        }
        spacing: 15


        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Transfer Market")
            font: Fonts.nunitoSans(30)
        }

        RowLayout {
            Layout.topMargin: 25
            Layout.alignment: Qt.AlignHCenter
            spacing: 20
            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Kind")
                    font: Fonts.nunitoSansBold(12)
                }

                DescriptionText {
                    id: kind
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Football")
                    font: Fonts.nunitoSans(12)
                }
            }

            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("City")
                    font: Fonts.nunitoSansBold(12)
                }

                DescriptionText {
                    id: city
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Lviv")
                    font: Fonts.nunitoSans(12)
                }
            }

            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Position")
                    font: Fonts.nunitoSansBold(12)
                }

                DescriptionText {
                    id: position
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("AMF")
                    font: Fonts.nunitoSans(12)
                }
            }

            ColumnLayout {
                DescriptionText {
                    text: qsTr("Age")
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(12)
                }

                DescriptionText {
                    id: age
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("24-28")
                    font: Fonts.nunitoSans(12)
                }
            }
        }

        ColoredButton {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 30
            Layout.preferredWidth: 70
            color: Colors.white
            fontColor: Colors.bgColor
            font: Fonts.nunitoSans(11)
            text: qsTr("Filters")
            onClicked: navigateToItem("qrc:/Pages/FiltersPage.qml", {isFilters: true})
        }

        Rectangle {
            Layout.topMargin: -13
            Layout.preferredHeight: 1
            Layout.preferredWidth: parent.width
            color: Colors.white
        }

        GridView {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
            Layout.topMargin: -20
            clip: true

            model: 10
            cellHeight: 210
            cellWidth: parent.width / 2



            delegate: Item {
                height: GridView.view.cellHeight
                width: GridView.view.cellWidth
                TransferMarketItem {
                    anchors.centerIn: parent
                    width: parent.width - 10
                    height: parent.height - 20
                }
            }
        }
    }
}
