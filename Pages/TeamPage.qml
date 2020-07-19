import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/PerfectialCup.jpg"
    nextButtonVisible: false

    ColoredButton {
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
        }
        height: 30
        width: 30
        color: Colors.transparentColor

        Image {
            anchors.fill: parent
            source: "qrc:/images/assets/icons/settings_white.png"
        }

        onClicked: navigateToItem("qrc:/Pages/TeamSettingsPage.qml")
    }

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
                    ListElement {name: "Players"; destination: "qrc:/Pages/TeamReviewPage.qml"}
                    ListElement {name: "Gallery"}
                    ListElement {name: "Calendar"; destination: "qrc:/Pages/TeamCalendarPage.qml" }
                    ListElement {name: "Results"}
                    ListElement {name: "Statistics"; destination: "qrc:/Pages/CoachRoomPage.qml"}
                }

                delegate: ColoredButton {
                    Layout.preferredHeight: 60
                    Layout.preferredWidth: 180
                    color: Colors.secondaryColorWithOpacity

                    font: Fonts.nunitoSans(14)
                    fontColor: Colors.white
                    text: model.name
                    onClicked: navigateToItem(model.destination)
                }
            }

        }

    }
}
