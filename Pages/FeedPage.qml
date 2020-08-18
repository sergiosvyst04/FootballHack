import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"

    ColumnLayout {
        anchors {
            fill: parent
            rightMargin: 20
            leftMargin: 20
        }
        spacing: 20


        Rectangle {
            Layout.alignment: Qt.AlignRight
            Layout.preferredHeight: 95
            Layout.preferredWidth: 95
            radius: 50
            color: Colors.wateringBarBackgroundColor

            ColumnLayout {
                anchors.fill: parent
                Image {
                    Layout.alignment: Qt.AlignHCenter
                    sourceSize: Qt.size(45,45)
                    source: "qrc:/images/assets/icons/WhiteWaterGlass.png"
                }

                DescriptionText {
                    Layout.fillWidth: true
                    font: Fonts.nunitoSans(12)
                    text: qsTr("Drink water")
                    wrapMode: Text.WordWrap
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: wateringPopup.active = true
            }
        }

        MealTimeItem {
            Layout.fillWidth: true
            mealTime: qsTr("Breakfast")
            onAddDishClicked: navigateToItem("qrc:/Pages/AddDishPage.qml")
        }

        MealTimeItem {
            Layout.fillWidth: true
            mealTime: qsTr("Lunch")
            onAddDishClicked: navigateToItem("qrc:/Pages/AddDishPage.qml")
        }

        MealTimeItem {
            Layout.fillWidth: true
            mealTime: qsTr("Second lunch")
            onAddDishClicked: navigateToItem("qrc:/Pages/AddDishPage.qml")
        }

        MealTimeItem {
            Layout.fillWidth: true
            mealTime: qsTr("Dinner")
            onAddDishClicked: navigateToItem("qrc:/Pages/AddDishPage.qml")
        }

        MealTimeItem {
            Layout.fillWidth: true
            mealTime: qsTr("Second Dinner")
            onAddDishClicked: navigateToItem("qrc:/Pages/AddDishPage.qml")
        }

        Item {
            Layout.fillHeight: true
        }

    }

    Loader {
        id: wateringPopup
        active: false

        sourceComponent: Popup {
            anchors.centerIn: parent
            width: 250
            height: 400
            modal: true
            parent: Overlay.overlay
            visible: true

            onAboutToHide: wateringPopup.active = false

            background: Rectangle {
                color: Colors.secondaryColor
            }

            contentItem: ColumnLayout {
                anchors {
                    fill: parent
                    topMargin: 25
                    leftMargin: 15
                    rightMargin: 15
                    bottomMargin: 35
                }
                spacing: 25

                Image {
                    Layout.alignment: Qt.AlignHCenter
                    source: "qrc:/images/assets/icons/WhiteWaterGlass.png"
                    sourceSize: Qt.size(60, 60)
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(15)
                    text: qsTr("Drink water")
                }

                DescriptionText {
                    Layout.fillWidth: true
                    font: Fonts.nunitoSans(13)
                    wrapMode: Text.WordWrap
                    text: qsTr("We strongly recommend you drink only water")
                }

                RowLayout {
                    spacing: 25
                    LabeledTextEdit {
                        Layout.preferredWidth: 105
                        label: qsTr("Amount")
                        textField.height: 40
                        textField.inputMethodHints: Qt.ImhDigitsOnly
                        textField.background: Rectangle {
                            anchors.fill: parent
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
                        font: Fonts.nunitoSans(12)
                        text: qsTr("ml")
                    }
                }

                ColoredButton {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 80
                    color: Colors.transparentColor
                    text: qsTr("Add")
                    enabled: teamNameField.text !== ""
                    font: Fonts.nunitoSansBold(20)
                    fontColor: Colors.white

                    opacity: enabled ? 1 : 0.4
                    onClicked: wateringPopup.active = false
                }
            }
        }

    }

}
