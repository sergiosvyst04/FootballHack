import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/PerfectialCup.jpg"
    nextButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            bottomMargin: 40
        }

        spacing: 20

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20
            Image {
                Layout.alignment: Qt.AlignHCenter
                sourceSize: Qt.size(110, 110)
                source: "qrc:/images/assets/icons/PerfectialLogo.png"
            }

            DescriptionText {
                Layout.alignment: Qt.AlignHCenter
                font: Fonts.nunitoSansBold(15)
                text: qsTr("Perfectial")
            }
        }

        ColumnLayout {
            spacing: 20
            Repeater {
                model: ListModel {
                    ListElement {name: "Players"}
                    ListElement {name: "Gallery"}
                    ListElement {name: "Calendar"}
                    ListElement {name: "Results"}
                    ListElement {name: "Statistics"}
                }

                delegate: ColoredButton {
                    Layout.preferredHeight: 60
                    Layout.preferredWidth: 180
                    color: Colors.secondaryColorWithOpacity

                    font: Fonts.nunitoSans(14)
                    fontColor: Colors.white
                    text: model.name
                }
            }

        }

    }
}
