import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {
    nextButtonVisible: true
    bgImage: "qrc:/images/assets/icons/bright1.jpg"

    footer: Item {}
    header: Item {}

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 25
            rightMargin: 25
            bottomMargin: 33
        }
        spacing: 30

        Item {
            Layout.fillHeight: true
        }

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 280
            Layout.preferredHeight: 220
            color: Colors.secondaryColorWithOpacity
            radius: 20

            DescriptionText {
                anchors.centerIn: parent
                font: Fonts.nunitoSans(25)
                textFormat: Text.PlainText
                color: Colors.white
                lineHeightMode: Text.FixedHeight
                lineHeight: 41
                opacity: 0.74
                text: qsTr(" Make your
 dream career")
            }
        }

        Item {
            Layout.fillHeight: true
        }

        ColoredButton {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            color: "transparent"
            back.border.width: 1
            back.border.color: Colors.white
            font: Fonts.nunitoSans(19, 0)
            fontColor: Colors.white
            text: qsTr("Sign Up")
            onClicked: navigateToItem("qrc:/Pages/CreateAccountPage.qml")
        }

        ColoredButton {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            color: "transparent"
            back.border.width: 2
            back.border.color: Colors.white
            font: Fonts.nunitoSansBold(19, 0)
            fontColor: Colors.white
            text: qsTr("Log In")
        }
    }

}


