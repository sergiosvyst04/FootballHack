import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

Rectangle {
    property alias logo: logo.source
    property alias name: teamName.text
    property string position
    property string age

    signal detailsClicked()

    color: Colors.secondaryColorWithOpacity

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 20
            leftMargin: 25
            rightMargin: 25
            bottomMargin: 20
        }

        RowLayout {
            spacing: 25
            Image {
                id: logo
                sourceSize: Qt.size(50, 50)

            }

            DescriptionText {
                id: teamName
                font: Fonts.nunitoSans(15)
            }
        }

        RowLayout {
            ColumnLayout {
                DescriptionText {
                    id: positionText
                    font: Fonts.nunitoSans(10)
                    text: qsTr("Posiition : %1").arg(position)
                }

                DescriptionText {
                    id: ageText
                    font: Fonts.nunitoSans(10)
                    text: qsTr("Age : %1").arg(age)
                }
            }

            Item {
                Layout.fillWidth: true
            }

            ColoredButton {
                Layout.preferredHeight: 35
                Layout.preferredWidth: 80

                color: Colors.white
                fontColor: Colors.bgColor
                font: Fonts.nunitoSans(11)
                text: qsTr("Details")
                onClicked: detailsClicked()
            }
        }
    }
}
