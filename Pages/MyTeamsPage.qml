import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/PerfectialCup.jpg"
    nextButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 20
            bottomMargin: 50
        }
        spacing: 70

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("My Teams")
            font: Fonts.nunitoSans(30)
        }

        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true

            spacing: 30

            model: ListModel {
                ListElement {name: "FC Perfectial"; logo: "qrc:/images/assets/icons/PerfectialLogo.png"}
                ListElement {name: "FC Spilnota"; logo: "qrc:/images/assets/icons/PerfectialLogo.png"}
                ListElement {name: "FC Liverpool"; logo: "qrc:/images/assets/icons/LiverpoolLogo.png"}
            }

            delegate: ColoredButton  {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 200
                height: 140
                color: Colors.secondaryColor

                onClicked: navigateToItem("qrc:/Pages/TeamPage.qml")

                ColumnLayout {
                    anchors {
                        fill: parent
                        topMargin: 10
                        bottomMargin: 20
                    }

                    Image {
                        Layout.alignment: Qt.AlignHCenter
                        sourceSize: Qt.size(80, 80)
                        source: model.logo
                    }

                    DescriptionText {
                        Layout.alignment: Qt.AlignHCenter
                        text: model.name
                        font: Fonts.nunitoSansBold(14)
                    }
                }
            }
        }
    }

}
