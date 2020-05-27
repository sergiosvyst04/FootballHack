import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.13
import "../Components"
import "../Singletons"

RowLayout {
    property string name
    property string team
    property string position
    property string dateOfBirth
    property string residence
    property alias ava: avatar.source

    spacing: 30

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
        DescriptionText {
            id: playerName
            font: Fonts.nunitoSansBold(16)
            text: name
        }

        DescriptionText {
            id: residenceText
            Layout.topMargin: 3
            font: Fonts.nunitoSansBold(11)
            text: residence
        }

        DescriptionText {
            id: playerTeamAndPosition
            font: Fonts.nunitoSans(11)
            text: "%1(%2)".arg(team).arg(position)
        }

        DescriptionText {
            id: playerAge
            font: Fonts.nunitoSans(11)
            text: dateOfBirth
        }
    }
}
