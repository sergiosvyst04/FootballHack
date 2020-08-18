import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

ColumnLayout {
    property alias mealTime: mealTime.text
    property ListModel dishesList

    signal addDishClicked()


    ColoredButton {
        Layout.fillWidth: true
        Layout.preferredHeight: 55
        RowLayout {
            anchors {
                fill: parent
                leftMargin: 34
                rightMargin: 20
            }

            DescriptionText {
                id: mealTime
                Layout.alignment: Qt.AlignLeft
                font: Fonts.nunitoSans(14)
            }

            Item {
                Layout.fillWidth: true
            }

            ColoredButton {
                id: addDishButton
                color: Colors.transparentColor
                text: qsTr("+")
                font: Fonts.nunitoSans(25)
                fontColor: Colors.white
                onClicked: addDishClicked()
            }
        }
    }

    Repeater {
        id: mealTimeDishesList
        clip: true
        model: dishesList

        delegate: Rectangle {
            color: Colors.dishDelegateColor

            RowLayout {
                anchors {
                    fill: parent
                    leftMargin: 30
                    rightMargin: 12
                }
                ColumnLayout {
                    DescriptionText {
                        id: dishName
                        font: Fonts.nunitoSans(16)
                    }

                    DescriptionText {
                        id: dishWeight
                        font: Fonts.nunitoSans(11)
                        text: "(" + "g)"
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                DescriptionText {
                    id: dishCalories
                    font: Fonts.nunitoSans(11)
                    text:  "ccal"
                }

                ColoredButton {
                    Rectangle {
                        width: 30
                        height: 30
                        radius: 15
                        color: Colors.transparentColor
                        border.width: 1
                        border.color: Colors.white

                        DescriptionText {
                            anchors.centerIn: parent
                            font: Fonts.nunitoSansBold(15)
                            text: qsTr("i")
                        }
                    }
                }
            }
        }

    }

}
