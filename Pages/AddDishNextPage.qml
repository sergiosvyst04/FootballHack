import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

BasePage {
    nextButtonVisible: true
    nextButtonText: qsTr("Add dish")
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
//        }
//    }

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 20
            leftMargin: 15
            rightMargin: 15
        }
        spacing: 30

        ColoredButton {
            Layout.fillWidth: true
            Layout.preferredHeight: 90
            color: Colors.secondaryColor

            onClicked: navigateToItem("qrc:/Pages/DishInfoPage.qml", {dishName: dishName})

            RowLayout {
                anchors {
                    fill: parent
                    leftMargin: 25
                    rightMargin: 25
                    topMargin: 10
                    bottomMargin: 15
                }

                ColumnLayout {
                    spacing: 13
                    DescriptionText {
                        Layout.alignment: Qt.AlignLeft
                        font: Fonts.nunitoSansBold(14)
                        text: qsTr("Dish")
                    }

                    DescriptionText {
                        Layout.alignment: Qt.AlignLeft
                        font: Fonts.nunitoSans(20)
                        text: dishName
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                ColoredButton {
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 40
                    color: Colors.transparentColor
                    checkable: true

                    Image {
                        id: favouriteStarButton
                        anchors.centerIn: parent
                        source: parent.checked ? "qrc:/images/assets/icons/star_enabled.png" : "qrc:/images/assets/icons/star_disabled.png"
                        sourceSize: Qt.size(30, 30)
                    }
                }
            }
        }

        ColoredButton {
            Layout.fillWidth: true
            Layout.preferredHeight: 105
            color: Colors.secondaryColor

            RowLayout {
                anchors {
                    fill: parent
                    topMargin: 13
                    leftMargin: 25
                    bottomMargin: 25
                }

                spacing: 13

                LabeledTextEdit {
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
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignBottom
                    text: qsTr("grams")
                    font: Fonts.nunitoSans(12)
                }

                Item {
                    Layout.fillWidth: true
                }
            }
        }

        ColoredButton {
            Layout.fillWidth: true
            Layout.preferredHeight: 105
            color: Colors.secondaryColor

            ColumnLayout {
                anchors {
                    fill: parent
                    topMargin: 13
                    leftMargin: 25
                    rightMargin: 25
                    bottomMargin: 25
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Meal time")
                    font: Fonts.nunitoSansBold(13)
                }

                LocationCombobox {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50

                    background: Rectangle {
                        anchors.fill: parent
                        color: Colors.secondaryColor
                        opacity: 0.2
                    }

                    model: ["Breakfast", "Lunch", "Second lunch", "Dinner", "Second dinner"]

                    ColoredButton {
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                        }
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 30
                        color: Colors.transparentColor
                        text: qsTr("↓")
                        font: Fonts.nunitoSansBold(22)
                        fontColor: Colors.white
                    }
                }


            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
