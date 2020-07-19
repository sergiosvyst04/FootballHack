import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

ColoredButton {
    property string playerName
    property int age
    property alias avatar: avatar.source
    property alias errorsRespectsVisible: errorsRespectsColumn.visible

    color: Colors.secondaryColor

    RowLayout {
        anchors.fill: parent
        spacing: 25
        Image {
            id: avatar
            Layout.fillHeight: true
            Layout.preferredWidth: 90
        }

        ColumnLayout {
            DescriptionText {
                font: Fonts.nunitoSans(14)
                Layout.preferredWidth: 50
                wrapMode: Text.WordWrap
                text: playerName
                horizontalAlignment: Text.AlignLeft
            }

            DescriptionText {
                font: Fonts.nunitoSans(11)
                text: qsTr("Age : %1").arg(age)
            }
        }

        ColumnLayout {
            id: errorsRespectsColumn

            RowLayout {
                Image {
                    sourceSize: Qt.size(15, 15)
                    source: "qrc:/images/assets/icons/respect_icon.png"
                }

                DescriptionText {
                    font: Fonts.nunitoSans(14)
                    Layout.preferredWidth: 50
                    wrapMode: Text.WordWrap
                    text: "33"
                    horizontalAlignment: Text.AlignLeft
                }
            }

            RowLayout {
                Image {
                    sourceSize: Qt.size(15, 15)
                    source: "qrc:/images/assets/icons/519791-101_Warning-512.png"
                }
                DescriptionText {
                    font: Fonts.nunitoSans(11)
                    text: "50/37"
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }

    }
}
