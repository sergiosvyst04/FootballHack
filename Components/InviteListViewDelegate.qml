import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"
import QtGraphicalEffects 1.13


ColoredButton {
    id: root
    property bool forInvite: true
    property alias name: playerName.text
    property alias playerPhoto: playerAva.source

    color: Colors.secondaryColor

    RowLayout {
        anchors {
            fill : parent
            leftMargin: 10
            rightMargin: 20
            topMargin: 5
            bottomMargin: 5
        }
        spacing: 15

        Image {
            id: playerAva
            sourceSize: Qt.size(40, 40)


            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: playerAva.width
                    height: playerAva.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: playerAva.adapt ? playerAva.width : Math.min(playerAva.width, playerAva.height)
                        height: playerAva.adapt ? playerAva.height : width
                        radius: Math.min(width, height)
                    }
                }
            }
        }

        DescriptionText {
            id: playerName
            Layout.fillWidth: true
            font: Fonts.nunitoSansBold(11)
            horizontalAlignment: Text.AlignLeft
        }

        ColoredButton {
            id: inviteButton
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredHeight: 25
            Layout.preferredWidth: 70

            checkable: true

            visible: forInvite
            color: Colors.approveTextColor
            back.radius: 4
            back.opacity: checked ? 0.4 : 0.8
            font: Fonts.nunitoSans(10)
            fontColor: Colors.white
            text: checked ? qsTr("Invited") : qsTr("Invite")
        }
    }

}
