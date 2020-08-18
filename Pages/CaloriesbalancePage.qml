import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"
    nextButtonVisible: false
    backButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 30
            rightMargin: 30
        }
        spacing: 45

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Calories Balance")
            font: Fonts.nunitoSans(30)
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            ColumnLayout {
                spacing: 15
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(18)
                    color: Colors.approveTextColor
                    text: qsTr("Consumed")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(20)
                    color: Colors.approveTextColor
                    text: qsTr("1876")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(18)
                    color: Colors.warningTextColor
                    text: qsTr("Burned")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(20)
                    color: Colors.warningTextColor
                    text: qsTr("2056")
                }
            }

            ColumnLayout {
                WateringProgressBar {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: 160
                    Layout.preferredWidth: 60
                    value: 0.5
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(18)
                    color: Colors.wateringBarBackgroundColor
                    text: qsTr("Watering")
                }
            }
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Balance")
            font: Fonts.nunitoSans(21)
        }

        ProgressBar {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
        }

        DescriptionText {
            Layout.topMargin: -10
            Layout.fillWidth: true
            text: qsTr("You need to consume some calories")
            font: Fonts.nunitoSans(12)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        RowLayout {
            Layout.preferredWidth: parent.width

            NutrientCircularProgressBar {
                nutrient: qsTr("Proteins")
                norm: 150
                consumed: 80
                barColor: Colors.proteinsColor
            }

            NutrientCircularProgressBar {
                nutrient: qsTr("Fats")
                norm: 80
                consumed: 90
                barColor: Colors.fatsColor
            }

            NutrientCircularProgressBar {
                nutrient: qsTr("Carbonhydrates")
                norm: 350
                consumed: 300
                barColor: Colors.carbonHydratesColor
            }


        }

        Item {
            Layout.fillHeight: true
        }
    }
}
