import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"

    header: TextField {
        id: searchProductField
        height: 60
        placeholderText: qsTr("Search product...")
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
            topMargin: 15
            leftMargin: 15
            rightMargin: 15
        }

        TabBar {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            spacing: 0

            background: Rectangle {
                color: Colors.transparentColor
            }
            DishTabButton {
                height: 50
                text: "Popular"
            }

            DishTabButton {
                height: 50
                text: "Favourite"
            }

            DishTabButton {
                height: 50
                text: "My dishes"
            }
        }

        Repeater {
            model: 5
            delegate: ColoredButton {
                Layout.fillWidth: true
                Layout.preferredHeight: 50

                color: Colors.secondaryColor
                text: searchProductField.text
                contentItem: Text {
                    leftPadding: 40
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    text: parent.text
                    font: Fonts.nunitoSans(15)
                    color: Colors.white
                }
                onClicked: navigateToItem("qrc:/Pages/AddDishNextPage.qml", {dishName: text})
            }
        }


        Item {
            Layout.fillHeight: true
        }
    }


}
