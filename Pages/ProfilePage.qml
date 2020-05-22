import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"
    nextButtonVisible: false
    backButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 25
            rightMargin: 25
            bottomMargin: 40
        }
        spacing: 40

        RowLayout {
            Layout.fillWidth: true
            DescriptionText {
                Layout.alignment: Qt.AlignLeft
                font: Fonts.nunitoSansBold(13)
                text: qsTr("sergio_svyst04")
            }

            Item {
                Layout.fillWidth: true
            }

            ColoredButton {
                Layout.preferredHeight: 25
                Layout.preferredWidth: 25
                color: Colors.transparentColor

                onClicked: console.log("click")

                Image {
                    anchors.fill: parent
                    source: "qrc:/images/assets/icons/settings_white.png"
                }
            }
        }

        ProfileAvatarAndDataItem {
            Layout.fillWidth: true
            Layout.topMargin: -30
            userName: qsTr("Serhii Svyst")
            respectsAmount: "88"
            errorBalance: "108/85"
            ava: "qrc:/images/assets/icons/Avatar.png"
        }

        Switch {
            id: marketSwitch
            Layout.alignment: Qt.AlignRight
            text: qsTr("on market")


            indicator: Rectangle {
                id: rect
                anchors.right: parent.right
                implicitHeight: 25
                implicitWidth: 45
                radius: 12
                color: marketSwitch.checked ? Colors.activeSwitchColor : Colors.secondaryColorWithOpacity

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    x: marketSwitch.checked ? parent.width - width - 3 : 3
                    width: 20
                    height: 20
                    radius: 10
                    color: Colors.grey
                }
            }

            contentItem: Text {
                anchors {
                    right: rect.left
                    rightMargin: 15
                }
                text: marketSwitch.text
                color: Colors.white
                font: Fonts.nunitoSansBold(12)
                bottomPadding: marketSwitch.height / 2
            }
        }


        GridLayout {
            Layout.alignment: Qt.AlignHCenter
            columns: 2
            columnSpacing: 22
            rowSpacing: 22

            Repeater {
                model: ListModel {
                    ListElement {text: qsTr("My teams") }
                    ListElement {text: qsTr("Gallery") }
                    ListElement {text: qsTr("Biorgaphy") }
                    ListElement {text: qsTr("Responds") }
                }

                delegate: ColoredButton {
                    Layout.preferredHeight: 130
                    Layout.preferredWidth: 130

                    color: Colors.secondaryColorWithOpacity
                    font: Fonts.nunitoSans(15)
                    fontColor: Colors.white
                    text: model.text
                }
            }

            ColoredButton {
                Layout.preferredHeight: 130
                Layout.preferredWidth: 130
                visible: marketSwitch.checked

                color: Colors.secondaryColorWithOpacity
                font: Fonts.nunitoSans(15)
                fontColor: Colors.white
                text: qsTr("Invites")
            }

            ColoredButton {
                Layout.preferredHeight: 130
                Layout.preferredWidth: 130
                visible: marketSwitch.checked

                color: Colors.secondaryColorWithOpacity
                font: Fonts.nunitoSans(15)
                fontColor: Colors.white
                text: qsTr("Prepositions")
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}