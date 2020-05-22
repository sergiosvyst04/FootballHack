import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"


BasePage {
    bgImage: "qrc:/images/assets/icons/CreateTeamBG.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Create Team")

    property var teamName

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 30
            leftMargin: 20
            rightMargin: 20
        }
        spacing: 35

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            font: Fonts.nunitoSans(30)
            text: qsTr("Create Team")
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width - 40

            font: Fonts.nunitoSans(14)
            text: qsTr("You have already created <b>%1</b> team. Lets invite some players!").arg(teamName)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        LabeledTextEdit {
            Layout.fillWidth: true
            label: qsTr("Player name")
        }


        Item {
            Layout.fillHeight: true
        }
    }


}
