import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.13
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/WriteRespondBG.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Send Respond")

    ColumnLayout {
        anchors {
            fill: parent
            rightMargin: 20
            leftMargin: 20
        }
        spacing: 20

        RowLayout {
            spacing: 25
            Image {
                id: avatar
                Layout.alignment: Qt.AlignVCenter
                sourceSize: Qt.size(80, 80)
                source: "qrc:/images/assets/icons/Avatar.png"

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

            DescriptionText {
                text: qsTr("Serhii Svyst")
                font: Fonts.nunitoSansBold(16)
            }
        }

        ScrollingTextArea {
            id: advantagesTextArea
            Layout.fillWidth: true
            textAreaHeight: 80
            label: qsTr("Advantages")
            placeHolder: qsTr("Advantages...")

        }

        ScrollingTextArea {
            id: disAdvantagesTextArea
            Layout.fillWidth: true
            textAreaHeight: 80
            label: qsTr("Disadvantages")
            placeHolder: qsTr("Disadvantages...")
        }

        ScrollingTextArea {
            id: commentTextArea
            Layout.fillWidth: true
            textAreaHeight: 130
            label: qsTr("Comment")
            placeHolder: qsTr("Comment...")
        }

        Item {
            Layout.fillHeight: true
        }
    }

}
