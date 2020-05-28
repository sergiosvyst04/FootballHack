import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.13
import "../Components"
import "../Singletons"

ColoredButton {
    color: Colors.secondaryColor

    ColumnLayout {
        id: column
        anchors {
            fill: parent
            topMargin: 5
            bottomMargin: 10
            rightMargin: 5
            leftMargin: 5
        }

        Image {
            id: avatar
            Layout.preferredHeight: 115
            Layout.preferredWidth: parent.width
            source: "qrc:/images/assets/icons/Avatar.png"

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: avatar.width
                    height: avatar.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: avatar.width
                        height: avatar.height
                        radius: 4
                    }
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                height: 30
                width: parent.width
                color: Colors.bgColor

                DescriptionText {
                    anchors.centerIn: parent
                    text: qsTr("Serhii Svyst")
                    font: Fonts.nunitoSans(9)
                }
            }
        }

        RowLayout {
            DescriptionText {
                text: qsTr("Age")
                font: Fonts.nunitoSans(9)
            }

            Item {
                Layout.fillWidth: true
            }

            DescriptionText {
                text: qsTr("23")
                font: Fonts.nunitoSans(9)
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: Colors.white
        }

        RowLayout {
            DescriptionText {
                text: qsTr("City")
                font: Fonts.nunitoSans(9)
            }

            Item {
                Layout.fillWidth: true
            }

            DescriptionText {
                text: qsTr("Lviv")
                font: Fonts.nunitoSans(9)
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: Colors.white
        }

        RowLayout {
            DescriptionText {
                text: qsTr("Position")
                font: Fonts.nunitoSans(9)
            }

            Item {
                Layout.fillWidth: true
            }

            DescriptionText {
                text: qsTr("RD")
                font: Fonts.nunitoSans(9)
            }
        }


    }
}
