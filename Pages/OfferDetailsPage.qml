import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/OffersPageBG.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Send Request")

    property var name
    property var logo
    property var city
    property var leg
    property var kind
    property var position
    property var comment
    property var age



    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 10
            leftMargin: 18
            rightMargin: 18
            bottomMargin: 20
        }

        spacing: 30

        RowLayout {
            Layout.fillWidth: true
            spacing: 25

            Image {
                id: logoImage
                sourceSize: Qt.size(100, 100)
                source: logo
            }

            DescriptionText {
                id: teamName
                font: Fonts.nunitoSans(16)
                text: name
            }
        }

        GridLayout {
            columns: 2
            columnSpacing: 30
            rowSpacing: 30
            ColumnLayout {
                DescriptionText {
                    text: qsTr("City")
                    font: Fonts.nunitoSansBold(13)
                }

                DescriptionText {
                    id: cityText
                    font: Fonts.nunitoSans(13)
                    text: city
                }
            }

            ColumnLayout {
                DescriptionText {
                    text: qsTr("Kind of sport")
                    font: Fonts.nunitoSansBold(13)
                }

                DescriptionText {
                    id: kindOfSport
                    font: Fonts.nunitoSans(13)
                    text: kind
                }
            }


            ColumnLayout {
                DescriptionText {
                    text: qsTr("Position")
                    font: Fonts.nunitoSansBold(13)
                }

                DescriptionText {
                    id: positionText
                    font: Fonts.nunitoSans(13)
                    text: position
                }
            }

            ColumnLayout {
                DescriptionText {
                    text: qsTr("Working leg")
                    font: Fonts.nunitoSansBold(13)
                }



                DescriptionText {
                    id: legText
                    font: Fonts.nunitoSans(13)
                    text: leg
                }
            }

        }

        ColumnLayout {
            DescriptionText {
                text: qsTr("Age")
                font: Fonts.nunitoSansBold(13)
            }

            DescriptionText {
                id: ageText
                font: Fonts.nunitoSans(13)
                text: age
            }
        }

        Rectangle {
            id: commentRect
            Layout.fillWidth: true
            Layout.preferredHeight: commentText.implicitHeight + 30

            color: Colors.secondaryColorWithOpacity

            DescriptionText {
                id: commentText
                anchors {
                    fill: parent
                    margins: 13
                }

                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignLeft

                font: Fonts.nunitoSans(11)
                text: comment
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
