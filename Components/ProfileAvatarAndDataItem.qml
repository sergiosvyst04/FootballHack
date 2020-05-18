import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.13
import "../Singletons"
import "../Components"

RowLayout {
    property alias ava: avatar.source
    property alias respectsAmount: respects.text
    property alias errorBalance: errorBalance.text
    property alias userName: name.text


    spacing: 25

    Image {
        id: avatar
        Layout.alignment: Qt.AlignVCenter
        sourceSize: Qt.size(80, 80)

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: avatar.width
                height: avatar.height
                Rectangle {
                    anchors.centerIn: parent
                    width: avatar.adapt ? avatar.width : Math.min(avatar.width, avatar.height)
                    height: avatar.adapt ? avatar.height : width
                    radius: Math.min(width, height)
                }
            }
        }
    }

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 15

        DescriptionText {
            id: name
            Layout.alignment: Qt.AlignHCenter
            font: Fonts.nunitoSansBold(16)
        }

        RowLayout {
            ColumnLayout {
                DescriptionText {
                    id: errorBalance
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(11)
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(10)
                    text: qsTr("Error balance")
                }
            }


            ColumnLayout {
                DescriptionText {
                    id: respects
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSansBold(11)
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    font: Fonts.nunitoSans(10)
                    text: qsTr("Respects")
                }
            }
        }
    }
}
