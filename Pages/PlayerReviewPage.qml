import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"
    property var tabBarIndex


    ColumnLayout {
        id: column
        anchors {
            fill: parent
            leftMargin: 18
            rightMargin: 18
            bottomMargin: 20
        }
        spacing: 20

        ProfileAvatarAndDataItem {
            Layout.leftMargin: 25
            Layout.fillWidth: true
            Layout.preferredHeight: 170

            userName: qsTr("Serhii Svyst")
            team: qsTr("FC Perfectial")
            position: qsTr("DEF")
            resindence: qsTr("Lviv, Ukraine")
            dateOfBirth: qsTr("23 (15.05.1997)")
            ava: "qrc:/images/assets/icons/Avatar.png"

        }

        TabBar {
            id: reviewTabBar
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth:  parent.width - 50
            Layout.preferredHeight: 30
            spacing: 0

            currentIndex: tabBarIndex

            background: Rectangle {
                color: Colors.transparentColor
            }

            ReviewTabButton {
                text: "Biography"
            }

            ReviewTabButton {
                text: "Gallery"
            }

            ReviewTabButton {
                text: "Responds"
            }
        }

        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: 20
            clip: true

            model: reviewTabBar.currentIndex === 0 ? biographyModel : reviewTabBar.currentIndex === 1 ? 8 : respondsModel

            delegate: reviewTabBar.currentIndex === 0 ? bioDelegate : reviewTabBar.currentIndex === 1 ? gallerydelegate : respondDelegate

                Component {
                    id: bioDelegate

                    BiographyItem {
                        width: column.width
                        fontSize: 11
                        team: model.team
                        years: model.years
                    }
                }

                Component {
                    id: gallerydelegate

                    Rectangle {
                        width: column.width
                        height: 100
                        color: "red"
                        opacity: 0.5
                    }
                }

                Component {
                    id: respondDelegate

                    RespondItem {
                        width: column.width

                        ava: model.writerAva
                        name: model.writer
                        respond: model.comment
                        advantages: model.advantages
                        disadvantages: model.disadvantages
                    }
                }
        }
        /*Rectangle {
                width: parent.width
                height: 110
                color: reviewTabBar.currentIndex === 0 ? "blue" : reviewTabBar.currentIndex === 1 ? "red" : "yellow"
                opacity: 0.5

                DescriptionText {
                    anchors.centerIn: parent
                    text: modelData + 1

                }
            }*/


    }

    ListModel {
        id: biographyModel

        ListElement {team : "FC Lokomotive Lviv(jun)"; years: "2007 - 2011"}
        ListElement {team : "FC Pokrova Lviv(jun)"; years: "2011 - 2013"}
        ListElement {team : "FC Opir Lviv(jun)"; years: "2013 - 2014"}
        ListElement {team : "FC Opir Lviv"; years: "2014 - 2015"}
        ListElement {team : "FC Corona Lviv"; years: "2015 - 2016"}
        ListElement {team : "FC Dobromyl"; years: "2016 - 2017"}
        ListElement {team : "FC Riasne Ruske"; years: "2018 - 2019"}
        ListElement {team : "FC Sokil Sokilnyky"; years: "2020 - 2022"}
        ListElement {team : "FC Liverpool"; years: "2023 - 2030"}
    }

    ListModel {
        id: respondsModel

        ListElement {writerAva: "qrc:/images/assets/icons/kloppp.jpeg"  ;writer: "Jurgen Glop"; comment : "He is the best defender i have ever seen. I am sure that i want to see this guy in my team in 2021 or even earlier. We are ready to get big money for him. I believe that FC Perfectial will give agreement for this transfer."; advantages: "Power, stamina, defence qualities, speed, technical skills, crosses, head playing."; disadvatnages: "No disadvantages"}
        ListElement {writerAva: "qrc:/images/assets/icons/Guardiola.jpeg"  ;writer: "Josep Guardiolla"; comment : "He is the best defender i have ever seen. I am sure that i want to see this guy in my team in 2021 or even earlier. We are ready to get big money for him. I believe that FC Perfectial will give agreement for this transfer."; advantages: "Power, stamina, defence qualities, speed, technical skills, crosses, head playing."; disadvatnages: "No disadvantages"}
        ListElement {writerAva: "qrc:/images/assets/icons/Tsybyk.jpg"  ;writer: "Jurii Tsybyk"; comment : "He is the best defender i have ever seen. I am sure that i want to see this guy in my team in 2021 or even earlier. We are ready to get big money for him. I believe that FC Perfectial will give agreement for this transfer."; advantages: "Power, stamina, defence qualities, speed, technical skills, crosses, head playing."; disadvatnages: "No disadvantages"}
    }


}
