import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

ColoredButton {
    property string playerName
    property int age
    property alias avatar: avatar.source

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

        Item {
            Layout.fillWidth: true
        }

    }
}
