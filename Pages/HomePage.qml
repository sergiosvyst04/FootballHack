import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/HomePageBG.jpg"
    nextButtonVisible: false

    header: TextField {
        height: 60
        placeholderText: qsTr("Search team...")
        color: Colors.white
        font: Fonts.nunitoSans(12)

        leftPadding: 65



        background: Rectangle {
            anchors.fill: parent
            color: Colors.secondaryColorWithOpacity

            Rectangle {
                anchors {
                    fill: parent
                    leftMargin: 15
                    rightMargin: 15
                    bottomMargin: 10
                    topMargin: 10
                }
                color: Colors.bgColor
                opacity: 0.54

                Image {
                    anchors {
                        left: parent.left
                        leftMargin: 10
                        verticalCenter: parent.verticalCenter
                    }

                    source: "qrc:/images/assets/icons/search.png"
                    sourceSize: Qt.size(23, 23)
                }

            }
        }
    }


    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 18
            rightMargin: 18
            bottomMargin: 70
        }
        spacing: 20

        Item {
            Layout.fillHeight: true
        }

        Repeater {
            model: ListModel {
                ListElement {text: qsTr("Profile")}
                ListElement {text: qsTr("Create team")}
                ListElement {text: qsTr("Life hacks")}
            }

            delegate: ColoredButton {
                Layout.fillWidth: true
                Layout.preferredHeight: 140

                color: Colors.secondaryColorWithOpacity
                font: Fonts.nunitoSans(25)
                fontColor: Colors.white
                text: model.text
            }
        }
    }


}
