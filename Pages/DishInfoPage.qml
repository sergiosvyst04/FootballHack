import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {

    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"

    property var dishName

//    header: Item {
//        height: 60
//        ColoredButton {
//            anchors {
//                left: parent.left
//            }
//            width: imlicitWidth
//            height: 50
//            color: Colors.transparentColor
//            fontColor: Colors.white
//            font: Fonts.nunitoSansBold(16)
//            text: qsTr("← Add dish")
//            onClicked: navigateBack()
//        }
//    }

    ColumnLayout {
        anchors {
            fill: parent
            rightMargin: 15
            leftMargin: 15
        }
        spacing: 40

        RowLayout {
            DescriptionText {
                Layout.alignment: Qt.AlignVCenter
                text: dishName
                font: Fonts.nunitoSans(24)
            }

            Item {
                Layout.fillWidth: true
            }


            ColoredButton {
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                color: Colors.transparentColor
                checkable: true

                Image {
                    id: favouriteStarButton
                    anchors.centerIn: parent
                    source: parent.checked ? "qrc:/images/assets/icons/star_enabled.png" : "qrc:/images/assets/icons/star_disabled.png"
                    sourceSize: Qt.size(35, 35)
                }
            }
        }

        LabeledTextEdit {
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 60
            Layout.preferredHeight: 50

            label: qsTr("Amount")

            textField.leftPadding: 4
            textField.background: Rectangle {
                color: Colors.transparentColor

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: Colors.white
                }
            }
            DescriptionText {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                font: Fonts.nunitoSans(12)
            }
        }

        RowLayout {
            spacing: 50
            Item {
                Layout.fillWidth: true
            }

            ColumnLayout {
                spacing: 20
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(14)
                    text: qsTr("Energy")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(15)
                    text: qsTr("139, 6 kJ")
                }
            }

            ColumnLayout {
                spacing: 20
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(14)
                    text: qsTr("Calories")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(15)
                    text: qsTr("90 kcal")
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }

        RowLayout {
            spacing: 20

            ColumnLayout {
                spacing: 20
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(14)
                    text: qsTr("Proteins")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(15)
                    text: qsTr("20 g")
                }
            }

            ColumnLayout {
                spacing: 20
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(14)
                    text: qsTr("Fats")
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(15)
                    text: qsTr("5 g")
                }
            }

            ColumnLayout {
                spacing: 20
                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(14)
                    text: qsTr("Carbon<br>
Gydrates")
                }

                DescriptionText {
                    font: Fonts.nunitoSansBold(15)
                    text: qsTr("18 g")
                }
            }
        }


        Item {
            Layout.fillHeight: true
        }
    }
}
