import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

ColoredButton {
    id: root

    property bool isIncoming
    property int state
    property alias team: teamName.text
    property alias logo: logo.source

    color: Colors.secondaryColor

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 22
            leftMargin: 25
            rightMargin: 15
            bottomMargin: 25
        }

        RowLayout {
            spacing: 30
            Image {
                id: logo
                sourceSize: Qt.size(55, 55)
            }

            DescriptionText {
                id: teamName
                font: Fonts.nunitoSans(15, Font.MixedCase)
            }
        }

        RowLayout {
            Item {
                Layout.fillWidth: true
            }

            DescriptionText {
                id: requestState

                visible: !isIncoming
                font: Fonts.nunitoSans(9)
                text: root.state === 0 ? qsTr("Waiting for asnwer...") : root.state === 1 ? qsTr("Accepted!") : qsTr("Rejected!")
            }

            ColoredButton {
                id: acceptRequestButton
                Layout.preferredHeight: 30
                Layout.preferredWidth: 80
                color: Colors.approveTextColor
                visible: isIncoming

                text: qsTr("Accept")
                font: Fonts.nunitoSans(8)
                fontColor: Colors.white
            }

            ColoredButton {
                id: rejectRequestButton
                Layout.preferredHeight: 30
                Layout.preferredWidth: 80
                color: Colors.warningTextColor
                visible: isIncoming

                text: qsTr("Reject")
                font: Fonts.nunitoSans(8)
                fontColor: Colors.white
            }
        }
    }
}
