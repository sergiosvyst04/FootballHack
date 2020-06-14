import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.13
import "../Singletons"
import "../Components"

RowLayout {
    property bool isProfile
    property alias ava: avatar.source
//    property alias respectsAmount: respects.text
//    property alias errorBalance: errorBalance.text
    property alias userName: playerName.text
    property alias resindence: residenceText.text
    property alias dateOfBirth: playerAge.text
    property string team
    property string position




    spacing: 25

    Image {
        id: avatar
        Layout.alignment: Qt.AlignVCenter
        sourceSize: Qt.size(80, 80)

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: avatar.width
                height: avatar.height
                Rectangle {
                    anchors.centerIn: parent
                    width: avatar.adapt ? avatar.width : Math.min(avatar.width, avatar.height)
                    height: avatar.adapt ? avatar.height : width
                    radius: Math.min(width, height)
                }
            }
        }
    }

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 15

        DescriptionText {
            id: playerName
            font: Fonts.nunitoSansBold(16)
            text: name
        }

        ColumnLayout {
            id: reviewDataColumn
            visible: !isProfile
            DescriptionText {
                id: residenceText
                Layout.topMargin: 3
                font: Fonts.nunitoSansBold(11)
            }

            DescriptionText {
                id: playerTeamAndPosition
                font: Fonts.nunitoSans(11)
                text: "%1(%2)".arg(team).arg(position)
            }

            DescriptionText {
                id: playerAge
                font: Fonts.nunitoSans(11)
            }
        }


        RowLayout {
            id: errorsRespectsRow
            visible: isProfile

            ColoredButton {
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                color: Colors.transparentColor
                fontColor: Colors.white
                font: Fonts.nunitoSans(11)

                text: "44\n Error balance"

                onClicked: navigateToItem("qrc:/Pages/ErrorsTasksPage.qml")

//                ColumnLayout {
//                    anchors {
//                        fill: parent
//                        margins: 10
//                    }

//                    DescriptionText {
//                        id: errorBalance
//                        Layout.alignment: Qt.AlignHCenter
//                        font: Fonts.nunitoSansBold(11)
//                    }

//                    DescriptionText {
//                        Layout.alignment: Qt.AlignHCenter
//                        font: Fonts.nunitoSans(10)
//                        text: qsTr("Error balance")
//                    }
//                }
            }

            ColoredButton {
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                color: Colors.transparentColor
                fontColor: Colors.white
                font: Fonts.nunitoSans(11)

                text: "88\n Tasks"

                onClicked: navigateToItem("qrc:/Pages/ErrorsTasksPage.qml")

//                ColumnLayout {
//                    anchors {
//                        fill: parent
//                        margins: 10
//                    }

//                    DescriptionText {
//                        id: respects
//                        Layout.alignment: Qt.AlignHCenter
//                        font: Fonts.nunitoSansBold(11)
//                    }

//                    DescriptionText {
//                        Layout.alignment: Qt.AlignHCenter
//                        font: Fonts.nunitoSans(10)
//                        text: qsTr("Tasks")
//                    }
//                }
            }
        }


    }
}
